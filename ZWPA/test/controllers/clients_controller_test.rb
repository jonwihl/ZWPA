require 'test_helper'
class ClientsControllerTest < ActionDispatch::IntegrationTest

  setup do 
    create_clients
  end
  
  teardown do
      delete_clients
  end

  test "should get index" do
    get clients_url
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create a new client" do
    assert_difference('Client.count', 1) do
      post clients_url, params: { client: { name: "pnc", street_1: "123", street_2: "234", city: "Pittsburgh", state: "PA", zip: "11111", contact_phone: "1234566789", contact_email: "pnc@pnc.com", contact_title: "manager", contact_first_name: "bob", contact_last_name: "rob", active: true } }
    end
    assert_redirected_to client_url(assigns(:client))
  end

  test "should not create a new client with invalid params" do
    post clients_url, params: { client: { name: "pnc", street_1: "123", street_2: "234", city: "Pittsburgh", state: "PA", zip: "11111", contact_phone: "66789", contact_email: "pnc@pnc.com", contact_title: "manager", contact_first_name: "bob", contact_last_name: "rob", active: true } }
    assert_template :new
  end


  test "should show client" do
    get client_url(@phipps)
    assert_equal "Phipps Conservatory", assigns(:client).name
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@phipps)
    assert_not_nil assigns(:client)
    assert_equal "Phipps Conservatory", assigns(:client).name
    assert_response :success
  end

  test "should update a client" do
    patch client_url(@phipps), params: { client: { name: "pnc", street_1: "123", street_2: "234", city: "Pittsburgh", state: "PA", zip: "11111", contact_phone: "1231231234", contact_email: "pnc@pnc.com", contact_title: "manager", contact_first_name: "bob", contact_last_name: "rob", active: true} }
    assert_redirected_to client_url(@phipps)
    assert_equal "pnc is updated.", flash[:notice]    
  end

  test "should fail to update client with invalid params" do
    patch client_url(@phipps), params: { client: { name: "pnc", street_1: "123", street_2: "234", city: "Pittsburgh", state: "PA", zip: "11111", contact_phone: "66789", contact_email: "pnc@pnc.com", contact_title: "manager", contact_first_name: "bob", contact_last_name: "rob", active: true} }
    assert_template :edit
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) { delete client_path(@cmu) }
    assert_redirected_to clients_path
  end

  test "should archive/deactivate client" do
    assert_difference('Client.active.count', -1) { get archive_client_path(@cmu) }
    assert_redirected_to clients_path  
  end
end
