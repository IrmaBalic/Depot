class OrderedLineItem < ActiveRecord::Base
  belongs_to :ordered_product
  belongs_to :orders
end
