require 'test_helper'

class Fm::BillingsControllerTest < ActionController::TestCase
  setup do
    @fm_billing = fm_billings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fm_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fm_billing" do
    assert_difference('Fm::Billing.count') do
      post :create, fm_billing: { amount: @fm_billing.amount, collection_id: @fm_billing.collection_id, company_id: @fm_billing.company_id, manager_id: @fm_billing.manager_id, time: @fm_billing.time, user_id: @fm_billing.user_id }
    end

    assert_redirected_to fm_billing_path(assigns(:fm_billing))
  end

  test "should show fm_billing" do
    get :show, id: @fm_billing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fm_billing
    assert_response :success
  end

  test "should update fm_billing" do
    patch :update, id: @fm_billing, fm_billing: { amount: @fm_billing.amount, collection_id: @fm_billing.collection_id, company_id: @fm_billing.company_id, manager_id: @fm_billing.manager_id, time: @fm_billing.time, user_id: @fm_billing.user_id }
    assert_redirected_to fm_billing_path(assigns(:fm_billing))
  end

  test "should destroy fm_billing" do
    assert_difference('Fm::Billing.count', -1) do
      delete :destroy, id: @fm_billing
    end

    assert_redirected_to fm_billings_path
  end
end
