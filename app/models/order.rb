class Order < ActiveRecord::Base
	belongs_to :user
	has_many :ordered_line_items
	belongs_to :billing_address, class_name: "Address"
	belongs_to :shipping_address, class_name: "Address"
	before_create :generate_guid

	def last
	  Order.order("created_at DESC").first
	end
	def total_price
	  if OrderedLineItem.count
			ordered_line_items.to_a.sum { |item| item.total_price}
	  else 
	    0
	  end
	end
	def number_of_items
		sum = 0
	  	unless ordered_line_items.empty?
			ordered_line_items.each do |line_item|
				sum+=line_item.quantity
			end
	  	end
		sum
	end

	def generate_guid
		self.guid = SecureRandom.uuid
	end

end
