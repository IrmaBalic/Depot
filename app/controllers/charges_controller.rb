class ChargesController < ApplicationController
  skip_before_action  :authorize_admin
  include CurrentCart
  before_action :set_cart, :set_user
  before_action :set_order, only: [:new, :create]
  Stripe.api_key = "sk_test_qRvUT5VgLyKC4aQI7AxpHMkd"

  @@changed_shipping_address = nil
  @@changed_billing_address = nil

	def new
	end

	def index
	end
  def change
    if params[:shipping_address]
      @@changed_shipping_address = Address.find_by_id(params[:shipping_address][:id])
    end
    if params[:billing_address]
      @@changed_billing_address = Address.find_by_id(params[:billing_address][:id])
    end
    redirect_to new_charge_path
  end

  def create
    @order = Order.new
    @order.user = @user
    @order.shipping_address = @shipping_address
    @order.billing_address = @billing_address

    @cart.line_items.each do |line_item| 
      @ordered_product = OrderedProduct.create_item(line_item.product.title, line_item.product.image_url, line_item.product.price,line_item.product.description_bs, line_item.product.description_en)
      if line_item.product.discount
        @ordered_product.price = line_item.product.sale_price
      end
      @ordered_product.avatar = line_item.product.product_images.first.avatar
      @ordered_product.save
      @ordered_line_item = OrderedLineItem.new
      @ordered_line_item.quantity = line_item.quantity
      @ordered_line_item.ordered_product = @ordered_product
      @order.ordered_line_items << @ordered_line_item
    end
    @order.save
    if session[:user_id]
      UserMailer.confirmation_email(@order).deliver
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
  def set_order
    unless session[:user_id]
      @shipping_address = @user.last_shipping_address
      @billing_address = @user.last_billing_address
    else
      if @@changed_shipping_address
        @shipping_address = @@changed_shipping_address
      else
        @shipping_address = @user.default_shipping_address
      end
      if @@changed_billing_address
        @billing_address = @@changed_billing_address
      else
        @billing_address = @user.default_billing_address
      end
    end 
  end

end
