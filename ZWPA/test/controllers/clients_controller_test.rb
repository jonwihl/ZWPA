require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { active: @client.active, city: @client.city, contact_email: @client.contact_email, contact_first_name: @client.contact_first_name, contact_last_name: @client.contact_last_name, contact_phone: @client.contact_phone, contact_title: @client.contact_title, name: @client.name, state: @client.state, street_1: @client.street_1, street_2: @client.street_2, zip: @client.zip }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { active: @client.active, city: @client.city, contact_email: @client.contact_email, contact_first_name: @client.contact_first_name, contact_last_name: @client.contact_last_name, contact_phone: @client.contact_phone, contact_title: @client.contact_title, name: @client.name, state: @client.state, street_1: @client.street_1, street_2: @client.street_2, zip: @client.zip }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
