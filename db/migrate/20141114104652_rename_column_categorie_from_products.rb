class RenameColumnCategorieFromProducts < ActiveRecord::Migration
  def self.up
  	remove_reference :products, :categorie, index: true
  	add_reference :products, :category, index: true
  end
  def self.down
  	remove_reference :products, :category
  	add_reference :products, :categorie, index: true
  end
end
