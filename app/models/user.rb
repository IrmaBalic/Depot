class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :address
  has_and_belongs_to_many :shipping_addresses, class_name: "Address", join_table: "shipping_addresses_users"

  has_secure_password

  def last_shipping_address
  	shipping_addresses.order("created_at DESC").first
  end
end
