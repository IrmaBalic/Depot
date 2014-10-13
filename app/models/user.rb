class User < ActiveRecord::Base
  validates :name, :surname, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
end
