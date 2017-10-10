require 'test_helper'

class BordersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get borders_new_url
    assert_response :success
  end

end
