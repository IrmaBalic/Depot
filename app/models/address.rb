class Address < ActiveRecord::Base
  belongs_to :address_type
  belongs_to :city
  belongs_to :user
end
