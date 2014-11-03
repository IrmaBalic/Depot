class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :line_item, index: true

      t.timestamps null: false
    end
  end
end
