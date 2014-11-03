class Categorie < ActiveRecord::Base
		has_many :products
		has_many :ordered_products
		def self.dropdown_options 
			options = Categorie.order(:name).map{|r| [r.name, r.id] }
			[["Please select", -1]] + options 
		end
end
