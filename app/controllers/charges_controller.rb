class ChargesController < ApplicationController
  skip_before_action  :authorize_admin
  include CurrentCart
  before_action :set_cart
  Stripe.api_key = "sk_test_qRvUT5VgLyKC4aQI7AxpHMkd"
	def new
		@user = User.last
		@billing_address = @user.address
	end

	def index
		redirect_to new_charge_path
	end
	def create
	  # Amount in cents
	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
