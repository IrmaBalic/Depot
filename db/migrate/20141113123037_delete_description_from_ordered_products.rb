class DeleteDescriptionFromOrderedProducts < ActiveRecord::Migration
  def up
  	remove_column :ordered_products, :description  
  end
  def down
  	add_column :ordered_products, :description, :text  
  end
end
