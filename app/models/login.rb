class Login < ActiveRecord::Base
  belongs_to :role
  def new 
  	@roles = Role.all
  end
end
