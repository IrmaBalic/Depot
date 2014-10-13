class AddPasswordToUserLogin < ActiveRecord::Migration
  def change
    add_column :user_logins, :password, :string
  end
end
