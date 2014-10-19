class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :number
      t.integer :floor
      t.references :address_type, index: true
      t.references :city, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
