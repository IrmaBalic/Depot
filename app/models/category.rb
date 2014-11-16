class Category < ActiveRecord::Base
	has_many :products
	has_many :ordered_products
	has_many :category_translations
	translates :name
	globalize_accessors :locales => [:en, :bs], :attributes => [:name]

	def self.dropdown_options 
		options = Category.order(:name).map{|r| [r.name, r.id] }
		[["Please select", -1]] + options 
	end

#Translation
	def update_attr(name)
    	translation = category_translations.where(locale: I18n.locale).first
    	translation.name = name
    	translation.save
    end
    def self.create_item(name_bs, name_en)
    	category = Category.create!
    	translation_en = CategoryTranslation.create!(category: category, locale: "en", name: name_en)
    	translation_bs = CategoryTranslation.create!(category: category, locale: "bs", name: name_bs)
    	category
    end
end
