class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_line_items
  belongs_to :billing_address, class_name: "Address"
  belongs_to :shipping_address, class_name: "Address"
end
