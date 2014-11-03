class ExtendOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :billing_address, references: :address
  	add_reference :orders, :shipping_address, references: :address
  end
end
