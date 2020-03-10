require 'test_helper'

class PhotographersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get photographers_new_url
    assert_response :success
  end

  test "should get create" do
    get photographers_create_url
    assert_response :success
  end

  test "should get edit" do
    get photographers_edit_url
    assert_response :success
  end

  test "should get update" do
    get photographers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get photographers_destroy_url
    assert_response :success
  end

end
