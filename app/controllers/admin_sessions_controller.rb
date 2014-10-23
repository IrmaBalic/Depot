#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class AdminSessionsController < ApplicationController
  skip_before_action :authorize_admin
  #before_action :authorize_user_login
  def new
  end

    #@user = User.new(user_params)
    #role = Role.find_by_id(params[:role])

    #@user.role = role
  def create
    #raise
    user = User.find_by(email: params[:email])
    #if user and user.authenticate(params[:password])
    if user and user.password = params[:password]
      session[:user_id] = user.id
      session[:role] = user.role.name
      if session[:role] == 'Admin'
        redirect_to administrator_url
      else
        redirect_to store_url
      end
    else
      redirect_to signin_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:role] = nil
    redirect_to store_url
  end
end