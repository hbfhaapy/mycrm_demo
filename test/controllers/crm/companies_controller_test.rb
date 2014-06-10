require 'test_helper'

class Crm::CompaniesControllerTest < ActionController::TestCase
  setup do
    @crm_company = crm_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_company" do
    assert_difference('Crm::Company.count') do
      post :create, crm_company: { category_id: @crm_company.category_id, image: @crm_company.image, mail: @crm_company.mail, name: @crm_company.name, note: @crm_company.note, user_id: @crm_company.user_id, zipcode: @crm_company.zipcode }
    end

    assert_redirected_to crm_company_path(assigns(:crm_company))
  end

  test "should show crm_company" do
    get :show, id: @crm_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm_company
    assert_response :success
  end

  test "should update crm_company" do
    patch :update, id: @crm_company, crm_company: { category_id: @crm_company.category_id, image: @crm_company.image, mail: @crm_company.mail, name: @crm_company.name, note: @crm_company.note, user_id: @crm_company.user_id, zipcode: @crm_company.zipcode }
    assert_redirected_to crm_company_path(assigns(:crm_company))
  end

  test "should destroy crm_company" do
    assert_difference('Crm::Company.count', -1) do
      delete :destroy, id: @crm_company
    end

    assert_redirected_to crm_companies_path
  end
end
