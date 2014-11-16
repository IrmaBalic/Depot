class CreateBillingAddresses < ActiveRecord::Migration
   def change
    create_table :billing_addresses_users do |t|
      t.references :user, index: true
      t.references :address, index: true

      t.timestamps null: false
    end
  end
end
