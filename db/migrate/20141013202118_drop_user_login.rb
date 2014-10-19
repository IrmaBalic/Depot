class DropUserLogin < ActiveRecord::Migration
  def up
  	drop_table :user_logins
  end
  def down
  end
end
