class AddAvatarToOrderedProducts < ActiveRecord::Migration
 def self.up
    add_attachment :ordered_products, :avatar
  end

  def self.down
    remove_attachment :ordered_products, :avatar
  end
end
