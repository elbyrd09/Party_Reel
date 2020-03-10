require 'test_helper'

class AvailablePhotographersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get available_photographers_create_url
    assert_response :success
  end

end
