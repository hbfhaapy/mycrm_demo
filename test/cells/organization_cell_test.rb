require 'test_helper'

class OrganizationCellTest < Cell::TestCase
  test "map" do
    invoke :map
    assert_select "p"
  end
  

end
