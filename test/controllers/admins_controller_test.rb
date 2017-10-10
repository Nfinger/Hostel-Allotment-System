require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get admins_login_url
    assert_response :success
  end

  test "should get home" do
    get admins_home_url
    assert_response :success
  end

end
