class OrdersController < ApplicationController
  rescue_from Paypal::Exception::APIError, with: :paypal_api_error
  
  include CurrentCart
  before_action :set_cart, only:[:create, :new]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    no_stock = @order.check_stock(@cart)
    
    if no_stock.any?
      no_stock.map!{|item| item.size.product.name}
      redirect_to cart_path, alert: "There are no stock for this item: #{no_stock.to_sentence}."
      return
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save
      @order.add_line_items_from_cart(@cart)
      
      items = @order.payment_params
      
      
      Paypal.sandbox! if Rails.env.development?
      
      request = Paypal::Express::Request.new(
        :username   => "paloma-facilitator_api1.maximilianodeyork.com",
        :password   => "1385743679",
        :signature  => "Api-EGlR9MBGCCR71bss7X.AKzIqAgFY5IUqzAGvzJX.vULuQfpzMYAN",
        :custom_fields => {:order_id => @order.id}
      )
      
      payment_request = Paypal::Payment::Request.new(
        :currency_code => :EUR,
        :amount => @order.total,
        :items => items
      )
    
      response = request.setup(payment_request,
        notify_success_orders_url,
        notify_cancel_orders_url,
        :no_shipping => true
      )
      
      @order.update_attribute :token, response.token
      
      redirect_to response.redirect_uri
    else
      render :new
    end
  end
  
  def notify_success
    @order = Order.find_by_token(params[:token])
    @line_item = @order.line_items
    @order.line_items.each {|line_item| line_item.cart = nil}
    session[:cart_id] = nil
  end
  
  def notify_cancel
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
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
    
    def paypal_api_error(e)
      redirect_to root_url, alert: e.response.details.collect(&:long_message).join('<br />')
    end
end
