class ChangeQuantityTypeInOrderedLineItems < ActiveRecord::Migration
  def change
  	change_column :ordered_line_items, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end
