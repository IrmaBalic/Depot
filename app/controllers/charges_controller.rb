class ChargesController < ApplicationController
  skip_before_action  :authorize_admin
  include CurrentCart
  before_action :set_cart, :set_user
  Stripe.api_key = "sk_test_qRvUT5VgLyKC4aQI7AxpHMkd"
	def new
	#	unless session[:user_id]
   #   @user = User.last
   # else
   #   @user = User.find_by_id(session[:user_id])
   # end
    @shipping_address = @user.last_shipping_address
		@billing_address = @user.address
	end

	def index
	end
  def create
    @order = Order.new
    @order.user = @user

    @cart.line_items.each do |line_item| 

      @ordered_product = OrderedProduct.new
      @ordered_product.title = line_item.product.title
      @ordered_product.image_url = line_item.product.image_url
      @ordered_product.description = line_item.product.description 
      @ordered_product.price = line_item.product.price
      @ordered_product.categorie = line_item.product.categorie
      @ordered_product.save

      @ordered_line_item = OrderedLineItem.new
      @ordered_line_item.quantity = line_item.quantity
      @ordered_line_item.ordered_product = @ordered_product
      @order.ordered_line_items << @ordered_line_item

      @order.save
      #raise
    end

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
  def set_user
    unless session[:user_id]
      @user = User.last
    else
      @user = User.find_by_id(session[:user_id])
    end
  end


end
