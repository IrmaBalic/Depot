class AddNameToUserLogin < ActiveRecord::Migration
  def change
    add_column :user_logins, :name, :string
  end
end
