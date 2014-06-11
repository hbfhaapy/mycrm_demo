require 'test_helper'

class PropertyCellTest < Cell::TestCase
  test "activity_categories" do
    invoke :activity_categories
    assert_select "p"
  end
  
  test "activity_statuses" do
    invoke :activity_statuses
    assert_select "p"
  end
  
  test "company_categories" do
    invoke :company_categories
    assert_select "p"
  end
  
  test "contact_categories" do
    invoke :contact_categories
    assert_select "p"
  end
  
  test "contact_statuses" do
    invoke :contact_statuses
    assert_select "p"
  end
  
  test "contract_statuses" do
    invoke :contract_statuses
    assert_select "p"
  end
  
  test "deal_categories" do
    invoke :deal_categories
    assert_select "p"
  end
  
  test "deal_statuses" do
    invoke :deal_statuses
    assert_select "p"
  end
  
  test "phone_klasses" do
    invoke :phone_klasses
    assert_select "p"
  end
  
  test "plan_categories" do
    invoke :plan_categories
    assert_select "p"
  end
  
  test "plan_statuses" do
    invoke :plan_statuses
    assert_select "p"
  end
  
  test "project_activities_categories" do
    invoke :project_activities_categories
    assert_select "p"
  end
  

end
