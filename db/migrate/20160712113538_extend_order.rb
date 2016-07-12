class ExtendOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :shipped, :boolean, default: false
  	add_column :orders, :guid, :string
  end
end
