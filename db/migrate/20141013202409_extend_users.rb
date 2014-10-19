class ExtendUsers < ActiveRecord::Migration
  def change
	rename_column :users, :role, :role_id
	add_index :users, :role_id 
  end
end
