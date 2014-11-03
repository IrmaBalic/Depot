class AddOrderedProductToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :ordered_product, index: true
  end
end
