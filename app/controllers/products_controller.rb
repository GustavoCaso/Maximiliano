class ProductsController < ApplicationController
  before_action :set_product, only: [:show]


  # GET /products
  # GET /products.json
  def collection
    @collection = Product.with_category "coleccion"
  end

  def urban
    @collection = Product.with_category "urbano"
  end

  def accesories
    @collection = Product.with_category "accesorios"
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end



end
