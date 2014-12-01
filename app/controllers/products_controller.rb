class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart
  #before_action :authorize_user
  skip_before_action :authorize_admin
  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:title)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @category = @product.category.id
  end

  # POST /products
  # POST /products.json
  def create
  category = Category.find_by_id(params[:category])
    #Product.create_item(params[:product][:title], params[:product][:image_url], params[:product][:price], params[:product][:description_bs], params[:product][:description_en], params[:category])
  product = Product.create!(title: params[:product][:title],category: category, price: params[:product][:price], image_url: params[:product][:image_url])
  ProductTranslation.create!(product: product, locale: "en", description: params[:product][:description_en])
  ProductTranslation.create!(product: product, locale: "bs", description: params[:product][:description_bs])
  p = Product.last
  params[:product][:image].each do |image|
    product_image = ProductImage.new(product: p, avatar: image)
    product_image.save
  end
  redirect_to products_path
  end
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    category = Category.find_by_id(params[:category])
    @product.category = category
    @product.title = params[:product][:title]
    @product.price = params[:product][:price]
    @product.image_url = params[:product][:image_url]
    @product.update_attr(params[:product][:description_bs], params[:product][:description_en])
    @product.save
    params[:product][:image].each do |image|
      product_image = ProductImage.new(product: @product, avatar: image)
      product_image.save
    end
    redirect_to products_path
    #raise
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      #params.require(:product).permit(:title, :image_url, :price)
    end
end
