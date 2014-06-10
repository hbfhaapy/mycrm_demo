require 'test_helper'

class Cm::ContractsControllerTest < ActionController::TestCase
  setup do
    @cm_contract = cm_contracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cm_contracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cm_contract" do
    assert_difference('Cm::Contract.count') do
      post :create, cm_contract: { actual_amount: @cm_contract.actual_amount, agent_id: @cm_contract.agent_id, amount: @cm_contract.amount, company_id: @cm_contract.company_id, name: @cm_contract.name, plan_id: @cm_contract.plan_id, signed_at: @cm_contract.signed_at, started_at: @cm_contract.started_at, status_id: @cm_contract.status_id, user_id: @cm_contract.user_id }
    end

    assert_redirected_to cm_contract_path(assigns(:cm_contract))
  end

  test "should show cm_contract" do
    get :show, id: @cm_contract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cm_contract
    assert_response :success
  end

  test "should update cm_contract" do
    patch :update, id: @cm_contract, cm_contract: { actual_amount: @cm_contract.actual_amount, agent_id: @cm_contract.agent_id, amount: @cm_contract.amount, company_id: @cm_contract.company_id, name: @cm_contract.name, plan_id: @cm_contract.plan_id, signed_at: @cm_contract.signed_at, started_at: @cm_contract.started_at, status_id: @cm_contract.status_id, user_id: @cm_contract.user_id }
    assert_redirected_to cm_contract_path(assigns(:cm_contract))
  end

  test "should destroy cm_contract" do
    assert_difference('Cm::Contract.count', -1) do
      delete :destroy, id: @cm_contract
    end

    assert_redirected_to cm_contracts_path
  end
end
