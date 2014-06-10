require 'test_helper'

class Fm::IncomesControllerTest < ActionController::TestCase
  setup do
    @fm_income = fm_incomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fm_incomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fm_income" do
    assert_difference('Fm::Income.count') do
      post :create, fm_income: { amount: @fm_income.amount, collection_id: @fm_income.collection_id, company_id: @fm_income.company_id, note: @fm_income.note, time: @fm_income.time, user_id: @fm_income.user_id }
    end

    assert_redirected_to fm_income_path(assigns(:fm_income))
  end

  test "should show fm_income" do
    get :show, id: @fm_income
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fm_income
    assert_response :success
  end

  test "should update fm_income" do
    patch :update, id: @fm_income, fm_income: { amount: @fm_income.amount, collection_id: @fm_income.collection_id, company_id: @fm_income.company_id, note: @fm_income.note, time: @fm_income.time, user_id: @fm_income.user_id }
    assert_redirected_to fm_income_path(assigns(:fm_income))
  end

  test "should destroy fm_income" do
    assert_difference('Fm::Income.count', -1) do
      delete :destroy, id: @fm_income
    end

    assert_redirected_to fm_incomes_path
  end
end
