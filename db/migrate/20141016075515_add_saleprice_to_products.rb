class AddSalepriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sale_price, :decimal
  end
end
