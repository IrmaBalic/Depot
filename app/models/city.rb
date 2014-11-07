class City < ActiveRecord::Base
  belongs_to :country
  has_many :addresses, inverse_of: :city
  validates :country, presence: true
end
