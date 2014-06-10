require 'test_helper'

class Crm::Deal::PricelistsControllerTest < ActionController::TestCase
  setup do
    @crm_deal_pricelist = crm_deal_pricelists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_deal_pricelists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_deal_pricelist" do
    assert_difference('Crm::Deal::Pricelist.count') do
      post :create, crm_deal_pricelist: { contact_id: @crm_deal_pricelist.contact_id, content: @crm_deal_pricelist.content, deal_id: @crm_deal_pricelist.deal_id, dealed: @crm_deal_pricelist.dealed, user_id: @crm_deal_pricelist.user_id }
    end

    assert_redirected_to crm_deal_pricelist_path(assigns(:crm_deal_pricelist))
  end

  test "should show crm_deal_pricelist" do
    get :show, id: @crm_deal_pricelist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm_deal_pricelist
    assert_response :success
  end

  test "should update crm_deal_pricelist" do
    patch :update, id: @crm_deal_pricelist, crm_deal_pricelist: { contact_id: @crm_deal_pricelist.contact_id, content: @crm_deal_pricelist.content, deal_id: @crm_deal_pricelist.deal_id, dealed: @crm_deal_pricelist.dealed, user_id: @crm_deal_pricelist.user_id }
    assert_redirected_to crm_deal_pricelist_path(assigns(:crm_deal_pricelist))
  end

  test "should destroy crm_deal_pricelist" do
    assert_difference('Crm::Deal::Pricelist.count', -1) do
      delete :destroy, id: @crm_deal_pricelist
    end

    assert_redirected_to crm_deal_pricelists_path
  end
end
