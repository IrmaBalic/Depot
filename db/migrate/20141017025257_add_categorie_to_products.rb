class AddCategorieToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :categorie, index: true
  end
end
