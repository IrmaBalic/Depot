class OrderedProduct < ActiveRecord::Base
  belongs_to :categorie
  has_many :ordered_line_items
end
