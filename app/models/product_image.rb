class ProductImage < ActiveRecord::Base
    belongs_to :product
    has_attached_file :avatar, styles: {
        icon: '110x80>',
        large: '410*250>',
        medium: '157*124'
    }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
