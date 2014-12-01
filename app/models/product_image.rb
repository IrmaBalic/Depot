class ProductImage < ActiveRecord::Base
    belongs_to :product
    has_attached_file :avatar, styles: {
        thumb: '80x50>',
        square: '418*290>',
        medium: '300x300>'
    }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
