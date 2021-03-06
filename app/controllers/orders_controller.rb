class OrdersController < ApplicationController
  # rescue_from Paypal::Exception::APIError, with: :paypal_api_error

  include CurrentCart
  before_action :set_cart, only:[:create, :new]

  # GET /orders/new
  def new
    @order = Order.new
    @order.add_line_items_from_cart(@cart)
    no_stock = @order.check_stock(@cart)

    if no_stock.any?
      no_stock.map!{|item| item.size.product.name}
      redirect_to cart_path, alert: "There are no stock for this item: #{no_stock.to_sentence}."
      return
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save

      @order.add_line_items_from_cart(@cart)
      @paypal = PaypalInterface.new(@order)
      @paypal.express_checkout
      if @paypal.express_checkout_response.success?
        @paypal_url = @paypal.api.express_checkout_url(@paypal.express_checkout_response)
        redirect_to @paypal_url
      else
        flash[:notice] = "Problem with @paypal"
        render "new"

      end
    else
      flash[:notice] = "The order has not been save"
      render "new"
    end

  end

  def notify_success
    @order = Order.where(token: params[:token]).first
    @order.update_attribute(:payer_id, params[:PayerID])
    @paypal = PaypalInterface.new(@order)
    @paypal.do_express_checkout
    session[:cart_id] = nil
  end

  def notify_cancel
  end

  def notify

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :email, :address, :postcode, :city)
    end

    # def paypal_api_error(e)
    #   redirect_to root_url, alert: e.response.details.collect(&:long_message).join('<br />')
    # end
end
