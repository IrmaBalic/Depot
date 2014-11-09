class UserMailer < ActionMailer::Base
  default from: "no-reply@abhtech.com"

  def confirmation_email(order)
  	@order = order
  	@user = @order.user
  	@shipping_address = order.shipping_address
	@billing_address = order.billing_address
  	mail(to: @user.email, subject: "Confirmation email")
  end

  def registration_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Confirmation email")
  end
end
