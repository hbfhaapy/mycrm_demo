require 'test_helper'

class Crm::ContactsControllerTest < ActionController::TestCase
  setup do
    @crm_contact = crm_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_contact" do
    assert_difference('Crm::Contact.count') do
      post :create, crm_contact: { category_id: @crm_contact.category_id, company_id: @crm_contact.company_id, image: @crm_contact.image, job: @crm_contact.job, mail: @crm_contact.mail, msn: @crm_contact.msn, name: @crm_contact.name, note: @crm_contact.note, qq: @crm_contact.qq, status_id: @crm_contact.status_id, user_id: @crm_contact.user_id }
    end

    assert_redirected_to crm_contact_path(assigns(:crm_contact))
  end

  test "should show crm_contact" do
    get :show, id: @crm_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm_contact
    assert_response :success
  end

  test "should update crm_contact" do
    patch :update, id: @crm_contact, crm_contact: { category_id: @crm_contact.category_id, company_id: @crm_contact.company_id, image: @crm_contact.image, job: @crm_contact.job, mail: @crm_contact.mail, msn: @crm_contact.msn, name: @crm_contact.name, note: @crm_contact.note, qq: @crm_contact.qq, status_id: @crm_contact.status_id, user_id: @crm_contact.user_id }
    assert_redirected_to crm_contact_path(assigns(:crm_contact))
  end

  test "should destroy crm_contact" do
    assert_difference('Crm::Contact.count', -1) do
      delete :destroy, id: @crm_contact
    end

    assert_redirected_to crm_contacts_path
  end
end
