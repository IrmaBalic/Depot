class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_action :authorize_admin
  before_action :authorize_admin, :find_user_name, :find_category, :set_locale
  include CurrentCart
  before_action :set_cart
  
  protected

  def find_category
    @categories = Category.all
  end

  def authorize_user
  	unless User.find_by(id: session[:user_id])
  		redirect_to signin_url, notice: "Please log in"
  	end
  end

  def authorize_admin
    unless session[:role] == 'Admin'
      redirect_to store_url
    end
  end

  def authorize_user_login
    if User.find_by(id: session[:user_id])
      redirect_to store_url
    end
  end

  def find_user_name
    @user = User.find_by(id: session[:user_id])
  end
  #Localization
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  protect_from_forgery with: :exception
end
