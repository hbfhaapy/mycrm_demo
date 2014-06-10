require 'test_helper'

class Crm::DealsControllerTest < ActionController::TestCase
  setup do
    @crm_deal = crm_deals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_deal" do
    assert_difference('Crm::Deal.count') do
      post :create, crm_deal: { amount: @crm_deal.amount, category_id: @crm_deal.category_id, company_id: @crm_deal.company_id, contact_id: @crm_deal.contact_id, name: @crm_deal.name, status_id: @crm_deal.status_id, time: @crm_deal.time, user_id: @crm_deal.user_id }
    end

    assert_redirected_to crm_deal_path(assigns(:crm_deal))
  end

  test "should show crm_deal" do
    get :show, id: @crm_deal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm_deal
    assert_response :success
  end

  test "should update crm_deal" do
    patch :update, id: @crm_deal, crm_deal: { amount: @crm_deal.amount, category_id: @crm_deal.category_id, company_id: @crm_deal.company_id, contact_id: @crm_deal.contact_id, name: @crm_deal.name, status_id: @crm_deal.status_id, time: @crm_deal.time, user_id: @crm_deal.user_id }
    assert_redirected_to crm_deal_path(assigns(:crm_deal))
  end

  test "should destroy crm_deal" do
    assert_difference('Crm::Deal.count', -1) do
      delete :destroy, id: @crm_deal
    end

    assert_redirected_to crm_deals_path
  end
end
