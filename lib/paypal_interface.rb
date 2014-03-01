require 'paypal-sdk-merchant'


class PaypalInterface
  attr_reader :api, :express_checkout_response

  PAYPAL_RETURN_URL = Rails.application.routes.url_helpers.notify_success_orders_url(host: HOST_WO_HTTP)
  PAYPAL_CANCEL_URL = Rails.application.routes.url_helpers.notify_cancel_orders_url(host: HOST_WO_HTTP)
  PAYPAL_NOTIFY_URL = Rails.application.routes.url_helpers.notify_orders_url(host: HOST_WO_HTTP)


  def initialize(order)
    @api = PayPal::SDK::Merchant::API.new
    @order = order
    @line_items = @order.line_items
  end

  def express_checkout
    @set_express_checkout = @api.build_set_express_checkout({
      SetExpressCheckoutRequestDetails: {
        ReturnURL: PAYPAL_RETURN_URL,
        CancelURL: PAYPAL_CANCEL_URL,
        PaymentDetails: [
          {
            NotifyURL: PAYPAL_NOTIFY_URL,
            OrderTotal: {
              currencyID: "EUR",
              value: @order.total + Order::SHIPPING_PRICE
            },
            ItemTotal: {
              currencyID: "EUR",
              value: @order.total
            },
            ShippingTotal: {
              :currencyID => "EUR",
              :value => Order::SHIPPING_PRICE
            },
            PaymentDetailsItem:
              @line_items.map do |item|
               {
                 Name: item.size.product.name,
                 Quantity: item.quantity,
                 Amount: {
                   currencyID: "EUR",
                   value: item.size.price
                 },
                 ItemCategory: "Physical"
               }
              end,
            PaymentAction: "Sale"
          }
        ]
      }
    })

    @express_checkout_response = @api.set_express_checkout(@set_express_checkout)

    if @express_checkout_response.success?
      @order.set_payment_token(@express_checkout_response.Token)
    else
      @express_checkout_response.Errors
      raise @express_checkout_response.Errors.inspect
    end
  end


  def do_express_checkout
    @do_express_checkout_payment = @api.build_do_express_checkout_payment(
      {
        DoExpressCheckoutPaymentRequestDetails:{
          PaymentAction: "Sale",
          Token: @order.token,
          PayerID: @order.payer_id,
          PaymentDetails: [{
            OrderTotal: {
              currencyID: "EUR",
              value: @order.total + Order::SHIPPING_PRICE
            },
            NotifyURL: PAYPAL_NOTIFY_URL
          }]
        }
      }
    )

    @do_express_checkout_payment_response = @api.do_express_checkout_payment(@do_express_checkout_payment)


    if @do_express_checkout_payment_response.success?
      @do_express_checkout_payment_response.DoExpressCheckoutPaymentResponseDetails
      @do_express_checkout_payment_response.FMFDetails
      @order.update_stock
    else
      @do_express_checkout_payment_response.Errors
      raise @do_express_checkout_payment_response.Errors.inspect
    end

  end
end

