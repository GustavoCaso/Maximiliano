class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # search is a methos in the model
    @products = Product.search(params[:search]).page(params[:page]).per_page(4)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    ApplicationController::SIZES.each {|s| @product.sizes.new size: s}
  end

  # GET /products/1/edit
  def edit
    ApplicationController::SIZES.each {|s| @product.sizes.new(size: s )unless @product.sizes_exits_for(s) }
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)


    @product.sizes.each do |size|
      size.destroy! if size.price.nil?
      size.position = ApplicationController::SIZES.index(size.size) unless size.destroyed?
    end


    respond_to do |format|
      if @product.save
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end

  def update_price
    @index = params[:index]

    @price = params[:price].to_i
    @discount = params[:discount].to_i

    @final_discount = (@price - ((@price/100) * @discount))





  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category, :sub_category, :picture, :outlet, sizes_attributes:[:size, :price, :id, :stock, :discount, :position])
    end
end