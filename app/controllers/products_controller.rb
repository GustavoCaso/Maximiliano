class ProductsController < ApplicationController
  before_action :set_product, only: [:show]


  # GET /products
  # GET /products.json
  def collection
    @outlet = Product.find_all_by_outlet(true)
    @collection = Product.find_all_by_category( "coleccion") - @outlet
  end

  def urban
    @outlet = Product.find_all_by_outlet(true)
    @collection = Product.find_all_by_category("urbano") - @outlet
  end

  def accesories
    @outlet = Product.find_all_by_outlet(true)
    @collection = Product.find_all_by_category("accesorios") - @outlet
  end

  def outlet
    @collection = Product.find_all_by_outlet(true)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @related_product = Product.find_all_by_category(@product.category) - [@product]
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end



end
