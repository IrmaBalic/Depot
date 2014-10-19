class RemoveCategorieIdFromProducts < ActiveRecord::Migration
  def change
    remove_reference :products, :categorie_id, index: true
  end
end
