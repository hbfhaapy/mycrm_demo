require 'test_helper'

class Crm::PhonesControllerTest < ActionController::TestCase
  setup do
    @crm_phone = crm_phones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_phones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_phone" do
    assert_difference('Crm::Phone.count') do
      post :create, crm_phone: { klass_id: @crm_phone.klass_id, number: @crm_phone.number, phoneable_id: @crm_phone.phoneable_id, phoneable_type: @crm_phone.phoneable_type }
    end

    assert_redirected_to crm_phone_path(assigns(:crm_phone))
  end

  test "should show crm_phone" do
    get :show, id: @crm_phone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm_phone
    assert_response :success
  end

  test "should update crm_phone" do
    patch :update, id: @crm_phone, crm_phone: { klass_id: @crm_phone.klass_id, number: @crm_phone.number, phoneable_id: @crm_phone.phoneable_id, phoneable_type: @crm_phone.phoneable_type }
    assert_redirected_to crm_phone_path(assigns(:crm_phone))
  end

  test "should destroy crm_phone" do
    assert_difference('Crm::Phone.count', -1) do
      delete :destroy, id: @crm_phone
    end

    assert_redirected_to crm_phones_path
  end
end
