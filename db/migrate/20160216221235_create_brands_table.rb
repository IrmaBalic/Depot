class CreateBrandsTable < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
    end

    add_reference :products, :brand, index: true
  end
end
