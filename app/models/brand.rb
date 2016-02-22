class Brand < ActiveRecord::Base
	has_many :products
	
	def self.dropdown_options 
		options = Brand.all.map{|r| [r.name, r.id] }
		[["---", -1]] + options 
	end

	def self.selected(brand)
        if brand == nil 
            brand = -1
        end
        brand
    end
end