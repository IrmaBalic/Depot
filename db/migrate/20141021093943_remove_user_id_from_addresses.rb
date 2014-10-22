class RemoveUserIdFromAddresses < ActiveRecord::Migration
  def change
    remove_reference :addresses, :user, index: true
  end
end
