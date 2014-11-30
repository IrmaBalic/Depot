class UserMailer < MandrillMailer::TemplateMailer
  default from: "no-reply@abhtech.com"
  default from_name: "AbhTech"

  def confirmation_email(order)
    @user = order.user
    mandrill_mail(
      template: 'Order template',
      to: @user.email, 
      subject: "Confirmation email",
      vars: {
        'USER_NAME' => @user.name,
      }
    )
  	#@order = order
  	#@user = @order.user
  	#@shipping_address = order.shipping_address
	  #@billing_address = order.billing_address
    #mandrill_mail(
    #  template: 'RegistrationEmail',
    #  to: @user.email, 
    #  subject: "Confirmation email")/
  	#mail(to: @user.email, subject: "Confirmation email")
  end

  def registration_email(user)
  	@user = user
    mandrill_mail(
      template: 'RegistrationEmail',
      to: @user.email, 
      subject: "Confirmation email"
    )
  	#mail(to: @user.email, subject: "Confirmation email")
  end
end
