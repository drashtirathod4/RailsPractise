require "test_helper"

class UserarticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userarticles_index_url
    assert_response :success
  end

  test "should get show" do
    get userarticles_show_url
    assert_response :success
  end

  test "should get new" do
    get userarticles_new_url
    assert_response :success
  end

  test "should get edit" do
    get userarticles_edit_url
    assert_response :success
  end
end
