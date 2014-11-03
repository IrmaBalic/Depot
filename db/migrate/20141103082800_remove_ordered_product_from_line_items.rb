class RemoveOrderedProductFromLineItems < ActiveRecord::Migration
  def change
  	remove_reference :line_items, :ordered_product, index: true
  end
end
