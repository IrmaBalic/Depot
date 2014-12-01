class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  skip_before_action  :authorize_admin, only: [:show]
  include CurrentCart
  before_action :set_cart, :set_products

  def set_products
    @products = Product.all
  end
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all

  end

  def create 
    @category = Category.create_item(params[:category][:name_bs], params[:category][:name_en])
    redirect_to categories_path
  end
  def show
  end

  def edit
  end
    # PATCH/PUT /roles/1.json
  def update
    @category.update_attr(params[:category][:name_bs], params[:category][:name_en])
    redirect_to categories_path
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name_bs, :name_en)
    end
end
