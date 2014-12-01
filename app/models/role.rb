class Role < ActiveRecord::Base
	#has_many :user_logins, dependent: :destroy
	has_many :users, dependent: :destroy
	def self.dropdown_options 
		options = Role.order(:name).map{|r| [r.name, r.id] }
		[["Please select", -1]] + options 
	end
 	def self.selected(role)
        unless role
            role = -1
        end
        role
    end
end
