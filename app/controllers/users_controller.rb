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
    @edit = true
  end

   # GET /logins/1/edit
  def edit_password
    @role = @user.role.id
    @edit = true
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
      redirect_to signin_path, notice: t('registration_completed')
    else
      redirect_to new_user_path, alert: t('signup_error')
    end
  end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  def update
    role = Role.find_by_id(params[:role])
    if role
      @user.role = role
    end

    if params[:user][:old_password] && params[:user][:new_password] && params[:user][:password_confirmation]
      @resetPass = true
      if params[:user][:old_password] == @user.password_digest && params[:user][:new_password] == params[:user][:password_confirmation]
        @user.password_digest = params[:user][:new_password]
      else
        @wrongPass = true
      end
    end
    
    respond_to do |format|

      if @wrongPass
        format.html { redirect_to edit_user_path(@user), alert: t('save_pass_error') }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      elsif @user.update(user_params)
        format.html { 
          if session[:role] == 'Admin'
            redirect_to users_path, notice: 'User was successfully updated.'
          else 
            redirect_to edit_user_path(@user), notice: t('edit_profile_success')
          end
        }

        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to edit_user_path(@user), alert: t('save_data_error') }
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
