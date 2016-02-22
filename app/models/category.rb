class Category < ActiveRecord::Base
	has_many :products
	has_many :ordered_products
	has_many :category_translations
	translates :name
	globalize_accessors :locales => [:en, :bs], :attributes => [:name]

	def self.dropdown_options 
		options = Category.all.map{|r| [r.name, r.id] }
		[["---", -1]] + options 
	end
    def self.selected(category)
        if category == nil 
            category = -1
        end
        category
    end
#Translation
	def update_attr(name_bs, name_en)
    	translation_bs = category_translations.where(locale: "bs").first
    	translation_bs.name = name_bs
    	translation_bs.save
    	translation_en = category_translations.where(locale: "en").first
    	translation_en.name = name_en
    	translation_en.save
    end
    def self.create_item(name_bs, name_en)
    	category = Category.create!
    	translation_en = CategoryTranslation.create!(category: category, locale: "en", name: name_en)
    	translation_bs = CategoryTranslation.create!(category: category, locale: "bs", name: name_bs)
    	category
    end
end
