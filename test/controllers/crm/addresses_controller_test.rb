require 'test_helper'

class Crm::AddressesControllerTest < ActionController::TestCase
  setup do
    @crm_address = crm_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_address" do
    assert_difference('Crm::Address.count') do
      post :create, crm_address: { addressable_id: @crm_address.addressable_id, addressable_type: @crm_address.addressable_type, content: @crm_address.content }
    end

    assert_redirected_to crm_address_path(assigns(:crm_address))
  end

  test "should show crm_address" do
    get :show, id: @crm_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm_address
    assert_response :success
  end

  test "should update crm_address" do
    patch :update, id: @crm_address, crm_address: { addressable_id: @crm_address.addressable_id, addressable_type: @crm_address.addressable_type, content: @crm_address.content }
    assert_redirected_to crm_address_path(assigns(:crm_address))
  end

  test "should destroy crm_address" do
    assert_difference('Crm::Address.count', -1) do
      delete :destroy, id: @crm_address
    end

    assert_redirected_to crm_addresses_path
  end
end
