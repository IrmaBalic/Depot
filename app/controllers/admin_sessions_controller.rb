#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class AdminSessionsController < ApplicationController
  #skip_before_action :authorize_admin
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:role] = user.role.name
      redirect_to administrator_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroys
    session[:user_id] = nil
    session[:role = nil
    redirect_to store_url, notice: "Logged out"
  end
end