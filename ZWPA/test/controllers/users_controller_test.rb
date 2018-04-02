require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do 
    create_users
  end
  
  teardown do
      delete_users
  end

  test "should get index" do
    get users_url
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create a new user" do
    assert_difference('User.count', 1) do
      post users_url, params: { user: { active: true, email: "al@prc.com", first_name: "alan", last_name: "bar", password: "secrets1", password_confirmation: "secrets1", role: "administrator" } }
    end
    assert_redirected_to user_url(assigns(:user))
  end

  test "should not create a new user with invalid params" do
    post users_url, params: { user: { active: true, email: "al@prc.com", first_name: "alan", last_name: "bar", password: "se", password_confirmation: "se", role: "administrator" } }
    assert_template :new
  end


  test "should show user" do
    get user_url(@stacy)
    assert_equal "Stacy", assigns(:user).first_name
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@stacy)
    assert_not_nil assigns(:user)
    assert_equal "Stacy", assigns(:user).first_name
    assert_response :success
  end

  test "should update a user" do
    patch user_url(@stacy), params: { user: { active: true, email: "al@prc.com", first_name: "alan", last_name: "bar", password: "secrets1", password_confirmation: "secrets1", role: "administrator"} }
    assert_redirected_to user_url(@stacy)
    assert_equal "alan bar is updated.", flash[:notice]    
  end

  test "should fail to update user with invalid params" do
    patch user_url(@stacy), params: { user: { active: true, email: "al@prc.com", first_name: "alan", last_name: "bar", password: "secrets1", password_confirmation: "secrets1", role: "trator"}}
    assert_template :edit
  end

  test "should destroy user" do
    assert_difference('User.count', -1) { delete user_path(@stacy) }
    assert_redirected_to users_path
  end

end
