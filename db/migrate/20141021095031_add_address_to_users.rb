class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :address, index: true
    add_reference :users, :role
  end
end
