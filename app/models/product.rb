class Product < ActiveRecord::Base
	has_many :line_items
	has_many :product_translations
	belongs_to :category
	before_destroy :ensure_not_referenced_by_any_line_item
	validates :title, :image_url, presence:true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	translates :description
	globalize_accessors :locales => [:en, :bs], :attributes => [:description]
	def self.latest
	  Product.order(:updated_at).last
	end
    #Translation
	def update_attr(description)
    	translation = product_translations.where(locale: I18n.locale).first
    	translation.description = description
    	translation.save
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
