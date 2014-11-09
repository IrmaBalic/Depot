class OrderedLineItem < ActiveRecord::Base
  belongs_to :ordered_product
  belongs_to :orders
  def total_price
  	ordered_product.price*quantity
  end
end
