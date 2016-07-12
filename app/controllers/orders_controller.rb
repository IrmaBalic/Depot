class OrdersController < ApplicationController
	include CurrentCart
	before_action :set_cart
	skip_before_action :authorize_admin

	def index
		@orders = Order.order('created_at DESC')
	end

	def show
		@order = Order.find(params[:id])
	end

	#Used for updating order status
	def change_status
		order = Order.find(params[:id])
		unless order.shipped
			order.shipped = true
			order.shipping_date = Date.today
		end
		order.save
		redirect_to orders_path, notice: "Shipping status for order #{order.guid} changed."
	end

end
