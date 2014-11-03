class CreateOrderedProducts < ActiveRecord::Migration
  def change
    create_table :ordered_products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.references :categorie, index: true

      t.timestamps null: false
    end
  end
end
