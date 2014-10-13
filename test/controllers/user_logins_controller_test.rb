require 'test_helper'

class UserLoginsControllerTest < ActionController::TestCase
  setup do
    @user_login = user_logins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_logins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_login" do
    assert_difference('UserLogin.count') do
      post :create, user_login: { role_id: @user_login.role_id }
    end

    assert_redirected_to user_login_path(assigns(:user_login))
  end

  test "should show user_login" do
    get :show, id: @user_login
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_login
    assert_response :success
  end

  test "should update user_login" do
    patch :update, id: @user_login, user_login: { role_id: @user_login.role_id }
    assert_redirected_to user_login_path(assigns(:user_login))
  end

  test "should destroy user_login" do
    assert_difference('UserLogin.count', -1) do
      delete :destroy, id: @user_login
    end

    assert_redirected_to user_logins_path
  end
end
