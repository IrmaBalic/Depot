class Product < ActiveRecord::Base
	has_many :line_items
	has_many :product_translations
    has_many :product_images
    belongs_to :brand
	belongs_to :category
	validates :title, presence:true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	#validates :title, uniqueness: true
	translates :description
	globalize_accessors :locales => [:en, :bs], :attributes => [:description]
	def self.latest
	  Product.order(:updated_at).last
	end
    def sale_price
        price-(discount*0.01*price)
    end
    #Translation
	def update_attr(description_bs, description_en)
        translation_bs = product_translations.where(locale: "bs").first
        translation_bs.description = description_bs
        translation_bs.save
        translation_en = product_translations.where(locale: "en").first
        translation_en.description = description_en
        translation_en.save
    end
    def self.create_item(product_title, product_image_url, product_price, description_bs, description_en, category_id)
    	product = Product.create!(title: product_title, image_url: product_image_url, price: product_price, category_id: category_id)
    	translation_en = ProductTranslation.create!(product: product, locale: "en", description: description_en)
    	translation_bs = ProductTranslation.create!(product: product, locale: "bs", description: description_bs)
    end
	private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
