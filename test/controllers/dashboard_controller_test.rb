require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get crm" do
    get :crm
    assert_response :success
  end

  test "should get fm" do
    get :fm
    assert_response :success
  end

end
