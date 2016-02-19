class PopulateBrands < ActiveRecord::Migration
  def up
  	Brand.create(name: "Toshiba")
  	Brand.create(name: "LG")
  	Brand.create(name: "Apple")
  	Brand.create(name: "Samsung")
  	Brand.create(name: "Sony")
  	Brand.create(name: "Nokia")
  	Brand.create(name: "Lenovo")
  end

  def down
  	Brand.destroy_all
  end
end
