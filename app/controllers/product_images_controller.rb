class ProductImagesController < ApplicationController
  before_action :set_image
  def index
  end
  def destroy
  	@image.destroy
  	respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
  def set_image
    @image= ProductImage.find(params[:id])
  end
end
