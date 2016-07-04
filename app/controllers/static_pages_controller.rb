class StaticPagesController < ApplicationController
	include CurrentCart
	before_action :set_cart
	skip_before_action :authorize_admin
  def aboutus
  end

  def contact
  end

  def faq
  end
end
