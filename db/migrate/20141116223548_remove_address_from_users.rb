class RemoveAddressFromUsers < ActiveRecord::Migration
  def self.up
  	remove_reference :users, :address, index: true
  end
  def self.down
  	add_reference :users, :address, index: true
  end
end
