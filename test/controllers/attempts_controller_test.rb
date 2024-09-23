require "test_helper"

class AttemptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attempts_index_url
    assert_response :success
  end

  test "should get create" do
    get attempts_create_url
    assert_response :success
  end

  test "should get update" do
    get attempts_update_url
    assert_response :success
  end
end
