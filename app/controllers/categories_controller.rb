class CategoriesController < ApplicationController
  before_action :set_categorie, only: [:show, :edit, :update, :destroy]
  skip_before_action  :authorize_admin, only: [:show]
  include CurrentCart
  before_action :set_cart, :set_products

  def set_products
    @products = Product.all
  end
  def new
    @categorie = Categorie.new
  end

  def index
    @categories = Categorie.all

  end

  def create
    @categorie = Categorie.new(categorie_params)

    respond_to do |format|
      if @categorie.save
        format.html { redirect_to @categorie }
        format.json { render :show, status: :created, location: @categorie }
      else
        format.html { render :new }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
  end

  def edit
  end
    # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @categorie.update(categorie_params)
        format.html { redirect_to @categorie }
        format.json { render :show, status: :ok, location: @categorie }
      else
        format.html { render :edit }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @categorie.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def set_categorie
      @categorie = Categorie.find(params[:id])
    end

    def categorie_params
      params.require(:categorie).permit(:name)
    end
end
