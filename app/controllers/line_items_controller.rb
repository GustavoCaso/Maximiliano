class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only:[:create]

  # POST /line_items
  # POST /line_items.json
  def create
    size = Size.find(params[:size_id])
    @line_item = @cart.add_product(size.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.size.product, notice: 'Se añadido al Carrito' }

      else
        format.html { redirect_to @line_item.size.product, alert: "Problema" }

      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { head :no_content }
    end
  end
end
