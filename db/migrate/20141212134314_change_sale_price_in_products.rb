class ChangeSalePriceInProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :sale_price, :discount
  end
end
