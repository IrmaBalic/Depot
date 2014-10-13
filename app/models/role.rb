class Role < ActiveRecord::Base
	#has_many :user_logins, dependent: :destroy
	has_many :logins, dependent: :destroy
end
