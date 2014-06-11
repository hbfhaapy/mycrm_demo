require 'test_helper'

class DashboardCellTest < Cell::TestCase
  test "financial" do
    invoke :financial
    assert_select "p"
  end
  
  test "projects" do
    invoke :projects
    assert_select "p"
  end
  
  test "sales" do
    invoke :sales
    assert_select "p"
  end
  
  test "smartfinders" do
    invoke :smartfinders
    assert_select "p"
  end
  
  test "timeline" do
    invoke :timeline
    assert_select "p"
  end
  

end
