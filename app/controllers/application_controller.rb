class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_action :authorize_admin
  before_action :authorize_admin, :find_category, :set_locale, :find_user, :find_category_url
  include CurrentCart
  before_action :set_cart
  
  protected

  def find_category_url
    @desktop_tr = CategoryTranslation.where(name: "TV i monitori").first
    @desktop = @desktop_tr.category
    @laptop_tr = CategoryTranslation.where(name:"Laptopi").first
    @laptop = @laptop_tr.category
    @tablet_tr = CategoryTranslation.where(name:"Mobiteli i tableti").first
    @tablet = @tablet_tr.category
  end
  def find_category
    @categories = Category.all
  end

  def authorize_user
  	unless User.where(id: session[:user_id]).first
  		redirect_to signin_url, notice: "Please log in"
  	end
  end

  def authorize_admin
    unless session[:role] == 'Admin'
      redirect_to store_url
    end
  end

  def authorize_user_login
    if User.where(id: session[:user_id])
      redirect_to store_url
    end
  end

  def find_user
    if session[:user_id]
      puts "Session id: #{session[:user_id]}"
      u = User.find(session[:user_id])
      puts "User id: #{u.id}"
      
      @user = User.where(id: session[:user_id]).first
    end
  end
  #Localization
  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale  # store locale to session
  end
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  protect_from_forgery with: :exception
end
