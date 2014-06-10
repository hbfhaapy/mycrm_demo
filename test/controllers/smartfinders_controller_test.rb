require 'test_helper'

class SmartfindersControllerTest < ActionController::TestCase
  setup do
    @smartfinder = smartfinders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smartfinders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smartfinder" do
    assert_difference('Smartfinder.count') do
      post :create, smartfinder: { klass: @smartfinder.klass, name: @smartfinder.name, url: @smartfinder.url, user_id: @smartfinder.user_id }
    end

    assert_redirected_to smartfinder_path(assigns(:smartfinder))
  end

  test "should show smartfinder" do
    get :show, id: @smartfinder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smartfinder
    assert_response :success
  end

  test "should update smartfinder" do
    patch :update, id: @smartfinder, smartfinder: { klass: @smartfinder.klass, name: @smartfinder.name, url: @smartfinder.url, user_id: @smartfinder.user_id }
    assert_redirected_to smartfinder_path(assigns(:smartfinder))
  end

  test "should destroy smartfinder" do
    assert_difference('Smartfinder.count', -1) do
      delete :destroy, id: @smartfinder
    end

    assert_redirected_to smartfinders_path
  end
end
