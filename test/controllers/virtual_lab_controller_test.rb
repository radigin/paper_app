require 'test_helper'

class VirtualLabControllerTest < ActionDispatch::IntegrationTest
  test "should get show_diagram" do
    get virtual_lab_show_diagram_url
    assert_response :success
  end

end
