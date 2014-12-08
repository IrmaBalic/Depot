class OrderedProduct < ActiveRecord::Base
  belongs_to :category
  has_many :ordered_line_items
  has_many :ordered_product_translations
  translates :description
  globalize_accessors :locales => [:en, :bs], :attributes => [:description]
  has_attached_file :avatar, styles: {
        icon: '110x80>',
        large: '410*250>',
        medium: '157*124'
    }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	#Translation
	def self.create_item(product_title, product_image_url, product_price, description_bs, description_en)
		product = OrderedProduct.create!(title: product_title, image_url: product_image_url, price: product_price)
		translation_en = OrderedProductTranslation.create!(ordered_product: product, locale: "en", description: description_en)
		translation_bs = OrderedProductTranslation.create!(ordered_product: product, locale: "bs", description: description_bs)
		product
	end
end
