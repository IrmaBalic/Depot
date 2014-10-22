class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses_users do |t|
      t.references :user, index: true
      t.references :address, index: true

      t.timestamps null: false
    end
  end
end
