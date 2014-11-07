class AddChangeNullToAddresses < ActiveRecord::Migration
  def change
  	change_column_null :addresses, :city_id, false
  end
end
