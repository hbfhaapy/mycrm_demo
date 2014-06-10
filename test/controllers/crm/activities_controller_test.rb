require 'test_helper'

class Crm::ActivitiesControllerTest < ActionController::TestCase
  setup do
    @crm_activity = crm_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_activity" do
    assert_difference('Crm::Activity.count') do
      post :create, crm_activity: { activityable_id: @crm_activity.activityable_id, activityable_type: @crm_activity.activityable_type, category_id: @crm_activity.category_id, name: @crm_activity.name, note: @crm_activity.note, person_id: @crm_activity.person_id, status_id: @crm_activity.status_id, time: @crm_activity.time, user_id: @crm_activity.user_id }
    end

    assert_redirected_to crm_activity_path(assigns(:crm_activity))
  end

  test "should show crm_activity" do
    get :show, id: @crm_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm_activity
    assert_response :success
  end

  test "should update crm_activity" do
    patch :update, id: @crm_activity, crm_activity: { activityable_id: @crm_activity.activityable_id, activityable_type: @crm_activity.activityable_type, category_id: @crm_activity.category_id, name: @crm_activity.name, note: @crm_activity.note, person_id: @crm_activity.person_id, status_id: @crm_activity.status_id, time: @crm_activity.time, user_id: @crm_activity.user_id }
    assert_redirected_to crm_activity_path(assigns(:crm_activity))
  end

  test "should destroy crm_activity" do
    assert_difference('Crm::Activity.count', -1) do
      delete :destroy, id: @crm_activity
    end

    assert_redirected_to crm_activities_path
  end
end
