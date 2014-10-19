class User < ActiveRecord::Base
  belongs_to :role
  validates :role_id, presence: true
  has_many :addresses
	
  has_secure_password

end
