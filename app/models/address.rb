class Address < ActiveRecord::Base
  belongs_to :city
  validates :name, presence:true
  def find_user
    user = User.find_by(id: session[:user_id])
  end
end
