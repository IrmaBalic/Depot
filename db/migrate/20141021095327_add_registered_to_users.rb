class AddRegisteredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :registered, :boolean
    add_column :users, :surname, :string
  end
end
