class PopulateGuid < ActiveRecord::Migration
  def change
  	Order.all.each do |order|
  		if order.guid.blank?
  			order.guid = SecureRandom.uuid
  			order.save!
  		end
  	end
  end
end
