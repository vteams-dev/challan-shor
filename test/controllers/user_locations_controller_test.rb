require 'test_helper'

class UserLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_locations_create_url
    assert_response :success
  end

end
