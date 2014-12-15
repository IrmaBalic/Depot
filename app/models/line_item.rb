class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  def total_price
  	total = product.price*quantity
  	if product.discount
  		total = product.sale_price*quantity
  	end
  	total
  end
end
