class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize_admin

  def index
  	redirect_to new_address_path
  end

  def show
        redirect_to new_address_path

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


    if session[:user_id]
      @user = User.find_by_id(session[:user_id]) 
      @user.registered = true
    else
      @user = User.new
      @user.name = params[:user][:name]
      @user.surname = params[:user][:surname]
     	@user.password_digest = "blank"
     	@user.registered = false
      @tmp_user=@user
    end
    @user.shipping_addresses << @address

    unless params[:same_as_shipping]
        @billing_address = Address.new(billing_address_params)
        unless b_city = City.find_by(name: params[:billing_address][:city])
          unless b_country = Country.find_by(name: params[:billing_address][:country])
            b_country = Country.new(billing_country_params)
          end
          b_city = City.new
          b_city.postal_code=params[:billing_address][:postal_code]
          b_city.name = params[:billing_address][:city]
          b_city.country = b_country
        end
        @billing_address.city = b_city
        @billing_address.save
        @user.address = @billing_address
    else 
      @user.address = @address
    end

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
    def set_address
      @address = Address.find(params[:id])
    end

    def billing_address_params
      params.require(:billing_address).permit(:name, :number, :floor)
    end
    def billing_city_params
      params.require(:billing_address).permit(:city, :postal_code)
    end
    def billing_country_params
      params.require(:billing_address).permit(:country)
    end 
end
