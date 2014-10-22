class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	
	def add_product(product_id)
	    current_item = line_items.find_by(product_id: product_id)
	    if current_item
	      current_item.quantity += 1
	    else
	      current_item = line_items.build(product_id: product_id)
	    end
	    current_item
  	end
  	def total_price
      if LineItem.count
  		  line_items.to_a.sum { |item| item.total_price}
      else 
        0
      end
  	end
  	def self.number_of_items
  		sum = 0
  		LineItem.all.each do |line_item|
  			sum+=line_item.quantity
  		end
  		sum
  	end
end
