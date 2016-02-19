class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize_admin
  #before_action :authorize_user

  # GET /logins
  # GET /logins.json
  def index
    @users = User.all
    #@role = User()
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
   
  end
  def purchuase
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    end
    @orders = @user.orders.sort_by { |h| h[:created_at] }.reverse!
  end

  # GET /logins/new
  def new
   @user = User.new
  end

  # GET /logins/1/edit
  def edit
    @role = @user.role.id
  end

  # POST /logins
  # POST /logins.json
  def create

   # if params[:user][:role_id]
    #  @role = Role.find(params[:user][:role_id]) 
    #else 
    #  @role = Role.find_by(name: 'User');
    #end*/
    #@role = Role.find(params[:role])
    @user = User.new(user_params)
    if session[:role] == 'Admin'
      role = Role.find(params[:role])
    else 
      role = Role.where(name: 'User').first
    end
    @user.role = role
  
    if @user.save
      UserMailer.registration_email(@user).deliver
      #InvitationMailer.invite(invitation).deliver
    end
    redirect_to store_path
  end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  def update
    role = Role.find_by_id(params[:role])
    @user.role = role
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password_digest)
    end


end
