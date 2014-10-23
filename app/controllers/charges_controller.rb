class ChargesController < ApplicationController
  skip_before_action  :authorize_admin
  include CurrentCart
  before_action :set_cart
  Stripe.api_key = "sk_test_qRvUT5VgLyKC4aQI7AxpHMkd"
	def new
		unless session[:user_id]
      @user = User.last
    else
      @user = User.find_by_id(session[:user_id])
    end
    @shipping_address = @user.last_shipping_address
		@billing_address = @user.address
	end

	def index
	end
def create
  # Amount in cents
  @amount = ((@cart.total_price.to_i+40)*100)

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
@cart.destroy if @cart.id == session[:cart_id]
session[:cart_id] = nil
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to store_path

end


end
