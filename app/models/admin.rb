class Admin < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
 	has_secure_password
 	after_destroy :ensure_an_admin_remains

 	private
 		def ensure_an_admin_remains
 			if Admin.count.zero?
 				raise "Can't delete last admin"
 			end
 		end
end
