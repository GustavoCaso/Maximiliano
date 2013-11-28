class ProductsController < ApplicationController
  before_action :set_product, only: [:show]


  # GET /products
  # GET /products.json
  def collection
    @collection = Product.with_category( "coleccion").not_outlet
  end

  def urban
    @collection = Product.with_category( "urbano").not_outlet
  end

  def accesories
    @collection = Product.with_category( "accesorios").not_outlet
  end

  def outlet
    @collection = Product.outlet
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @related_product = Product.with_category(@product.category) - [@product]
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end



end
