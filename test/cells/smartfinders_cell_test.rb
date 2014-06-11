require 'test_helper'

class SmartfindersCellTest < Cell::TestCase
  test "form" do
    invoke :form
    assert_select "p"
  end
  

end
