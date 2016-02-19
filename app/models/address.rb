class Address < ActiveRecord::Base
  belongs_to :city
  validates :name, :number, :city, presence:true
  def find_user
    user = User.where(id: session[:user_id]).first
  end
end
