class CreateOrderedProductTranslationsTable < ActiveRecord::Migration
  def self.up
    OrderedProduct.create_translation_table!({
    	:description => :text
    	}, {
    	:migrate_data => true
    	})
  end
  def self.down
  	OrderedProduct.drop_translation_table! :migrate_data => true
  end
end
