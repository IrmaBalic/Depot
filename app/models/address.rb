class Address < ActiveRecord::Base
  belongs_to :city
  def find_user
    user = User.find_by(id: session[:user_id])
  end
end
