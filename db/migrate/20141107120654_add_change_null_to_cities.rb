class AddChangeNullToCities < ActiveRecord::Migration
  def change
  	  	change_column_null :cities, :country_id, false
  end
end
