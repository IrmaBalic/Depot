class OrdersController < ApplicationController
	include CurrentCart
	before_action :set_cart
	skip_before_action :authorize_admin
	def index
		@orders = Order.order('created_at DESC')
	end
end
