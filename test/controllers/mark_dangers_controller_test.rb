require 'test_helper'

class MarkDangersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get mark_dangers_create_url
    assert_response :success
  end

end
