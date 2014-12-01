class AddAvatarToProductImages < ActiveRecord::Migration
  def self.up
    add_attachment :product_images, :avatar
  end

  def self.down
    remove_attachment :product_images, :avatar
  end
end
