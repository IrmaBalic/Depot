class CreateOrderedLineItems < ActiveRecord::Migration
  def change
    create_table :ordered_line_items do |t|
      t.references :ordered_product, index: true
      t.references :order, index: true
      t.string :quantity

      t.timestamps null: false
    end
  end
end
