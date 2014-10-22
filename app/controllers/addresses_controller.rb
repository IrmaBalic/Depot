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
    unless city = City.find_by(name: params[:city][:name])
    	unless country = Country.find_by(name: params[:country][:name])
    		country = Country.new(country_params)
    	end
    	city = City.new(city_params)
    	city.country = country
    end
    @address.city = city
   	@address.save

   	@user = User.new
   	@user.name = params[:user][:name]
   	@user.surname = params[:user][:surname]
   	@user.password_digest = "blank"
   	@user.registered = false
   	@user.address = @address
    #if same_as_shipping
        @user.shipping_addresses << @address

 	  @user.save
    redirect_to new_charge_path
    
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
