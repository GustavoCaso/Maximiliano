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
    2.times{ @product.photos.build}
  end

  # GET /products/1/edit
  def edit
    ApplicationController::SIZES.each {|s| @product.sizes.new(size: s )unless @product.sizes_exits_for(s) }
    photos_count = @product.photos.count
    photos_count = 2 if photos_count == 0
    photos_count.times{@product.photos.build} if photos_count <= 2
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
    @photo = @product.photos()
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

  def delete_assests
    params[:delete].each do |id|
      Photo.find(id).destroy
      redirect_to admin_products_url
    end
  end

  def default_photo
    photo_id, product_id = params[:photo_id].split(" ")
    @product = Product.find(product_id)
    @product.photos.map do |photo|
      photo.update_attribute(:primary, false)
    end
    photo = Photo.find(photo_id)
    photo.update_attribute(:primary, true )
    redirect_to [:admin, @product]
  end

  def update_price
    @index = params[:index]
    @price = params[:price].to_f
    @discount = params[:discount].to_f
    @final_discount = (@price - ((@price/100) * @discount))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category, :sub_category, :picture,  :outlet, sizes_attributes:[:size, :price, :id, :stock, :discount, :position], photos_attributes:[:picture])
    end
end