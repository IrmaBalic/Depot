class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy, :change]
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
    @user = User.new
  end
  def new_billing
  end
  def create_billing
    #Shipping address
    @address = Address.new(address_params)  
    unless city = City.where(name: params[:city][:name]).first
      unless country = Country.where(name: params[:country][:name]).first
        country = Country.new(country_params)
      end
      city = City.new(city_params)
      city.country = country
    end
    @address.city = city
    #User
    if session[:user_id]
      @user = User.find_by_id(session[:user_id]) 
    else
      @user = User.last
    end
    @user.billing_addresses << @address

    if !@address.city.country.save and !@address.save and !@user.save
      render :action => :new_billing
    else 
      @address.save
      @user.save
      #raise
      redirect_to new_charge_path
    end
  end
  def new_shipping
  end
  def create_shipping
    #Shipping address
    @address = Address.new(address_params)  
    unless city = City.where(name: params[:city][:name]).first
      unless country = Country.where(name: params[:country][:name]).first
        country = Country.new(country_params)
      end
      city = City.new(city_params)
      city.country = country
    end
    @address.city = city
    #User
    if session[:user_id]
      @user = User.find_by_id(session[:user_id]) 
    else
      @user = User.last
    end
    @user.shipping_addresses << @address
    if !@address.city.country.save and !@address.save and !@user.save
      render :action => :new_shipping
    else 
      @address.save
      @user.save
      #raise
      redirect_to new_charge_path
    end
  end
  def change
  end
  def old_addresses
    @user = User.find_by_id(session[:user_id]) 
    @user.registered = true
  end

  def create
    #Shipping address
  	@address = Address.new(address_params)	
    unless city = City.where(name: params[:city][:name]).first
    	unless country = Country.where(name: params[:country][:name]).first
    		country = Country.new(country_params)
    	end
    	city = City.new(city_params)
    	city.country = country
    end
    @address.city = city
    #User
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
    # Billing address
    unless params[:same_as_shipping]
      # New billing address
        @billing_address = Address.new(billing_address_params)
        unless b_city = City.where(name: params[:billing_address][:city]).first
          unless b_country = Country.where(name: params[:billing_address][:country]).first
            b_country = Country.new
            b_country.name = params[:billing_address][:country]
          end
          b_city = City.new
          b_city.postal_code = params[:billing_address][:postal_code]
          b_city.name = params[:billing_address][:city]
          b_city.country = b_country
        end
        @billing_address.city = b_city
        @billing_address.save
        @user.billing_addresses << @billing_address
    else 
      # Billing address is same as shipping address
      @user.billing_addresses << @address
    end

    if !@address.city.country.save and !@address.save and !@user.save
      render :action => :new
    else 
      @address.save
   	  @user.save
      #raise
      redirect_to new_charge_path
    end
  end
  #end
  
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
