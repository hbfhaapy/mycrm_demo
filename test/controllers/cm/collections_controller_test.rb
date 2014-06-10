require 'test_helper'

class Cm::CollectionsControllerTest < ActionController::TestCase
  setup do
    @cm_collection = cm_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cm_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cm_collection" do
    assert_difference('Cm::Collection.count') do
      post :create, cm_collection: { contact_id: @cm_collection.contact_id, name: @cm_collection.name, percent: @cm_collection.percent, time: @cm_collection.time, user_id_id: @cm_collection.user_id_id }
    end

    assert_redirected_to cm_collection_path(assigns(:cm_collection))
  end

  test "should show cm_collection" do
    get :show, id: @cm_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cm_collection
    assert_response :success
  end

  test "should update cm_collection" do
    patch :update, id: @cm_collection, cm_collection: { contact_id: @cm_collection.contact_id, name: @cm_collection.name, percent: @cm_collection.percent, time: @cm_collection.time, user_id_id: @cm_collection.user_id_id }
    assert_redirected_to cm_collection_path(assigns(:cm_collection))
  end

  test "should destroy cm_collection" do
    assert_difference('Cm::Collection.count', -1) do
      delete :destroy, id: @cm_collection
    end

    assert_redirected_to cm_collections_path
  end
end
