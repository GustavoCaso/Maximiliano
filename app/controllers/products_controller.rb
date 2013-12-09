class ProductsController < ApplicationController
  before_action :set_product, only: [:show]


  # GET /products
  # GET /products.json
  def collection
    @collection = Product.all.where(category: "coleccion", outlet: false).includes(:sizes)
  end

  def urban
    @collection = Product.all.where(category: "urbano", outlet: false).includes(:sizes)
  end

  def accesories
    @collection = Product.all.where(category: "accesorios", outlet: false).includes(:sizes)
  end

  def outlet
    @collection = Product.all.where(outlet: true)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @related_product = Product.all.where(category: @product.category) - [@product]
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end



end
