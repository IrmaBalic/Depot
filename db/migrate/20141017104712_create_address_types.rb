class CreateAddressTypes < ActiveRecord::Migration
  def change
    create_table :address_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
