class AddressesController < ApplicationController
before_action :set_address, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize_admin

  def index
  	@addresses = Address.all
  end

  def show
  end

  def new
  	@address = Address.new
  end

  def create
  	
  	@address = Address.new(address_params)
  	address_type = AddressType.find_by_id(params[:address_type][:id])
  	
    unless city = City.find_by(name: params[:city][:name])
    	unless country = Country.find_by(name: params[:country][:name])
    		country = Country.new(country_params)
    	end
    	city = City.new(city_params)
    	city.country = country
    end

    @address.address_type = address_type
    @address.city = city
   #raise

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors }
      end
    end
  end
   private
  def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:name, :number, :floor)
    end
    def city_params
      params.require(:city).permit(:name, :postal_code)
    end
    def country_params
      params.require(:country).permit(:name)
    end
end
