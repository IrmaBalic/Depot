class User < ActiveRecord::Base
  belongs_to :role
  has_and_belongs_to_many :shipping_addresses, class_name: "Address", join_table: "shipping_addresses_users"
  has_and_belongs_to_many :billing_addresses, class_name: "Address", join_table: "billing_addresses_users"
  has_many :orders
  has_secure_password
  validates :name, :surname, presence: true
  def last_shipping_address
  	shipping_addresses.last
  end
  def last_billing_address
    billing_addresses.last
  end
  def last_user
  	User.order("created_at DESC").first
  end

  def default_shipping_address
    shipping_addresses.first
  end
  def default_billing_address
    billing_addresses.first
  end
end
