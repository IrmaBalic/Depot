class RemoveLineItemFromOrders < ActiveRecord::Migration
  def change
  	remove_reference :orders, :line_item, index: true
  end
end
