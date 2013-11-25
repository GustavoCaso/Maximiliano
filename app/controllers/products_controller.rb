class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_switch

  # GET /products
  # GET /products.json
  def collection
    @collection = Product.all.where(category: "coleccion")
  end

  def urban
    @collection = Product.all.where(category: "urbano")
  end

  def accesories
    @collection = Product.all.where(category: "accesorios")
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

    def set_switch
      @switch = params[:action]
    end

end
