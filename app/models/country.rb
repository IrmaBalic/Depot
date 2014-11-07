class Country < ActiveRecord::Base
	has_many :cities, inverse_of: :country
	validates :name, presence: true
end
