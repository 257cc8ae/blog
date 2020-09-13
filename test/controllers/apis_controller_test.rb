require 'test_helper'

class ApisControllerTest < ActionDispatch::IntegrationTest
  test "should get image" do
    get apis_image_url
    assert_response :success
  end

end
