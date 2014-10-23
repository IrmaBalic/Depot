class ExtendProducts < ActiveRecord::Migration
  def change
    add_reference :products, :categorie
  	add_index :products, :categorie_id
  end
end
