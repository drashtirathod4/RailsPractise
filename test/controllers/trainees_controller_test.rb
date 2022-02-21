require "test_helper"

class TraineesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trainees_index_url
    assert_response :success
  end

  test "should get show" do
    get trainees_show_url
    assert_response :success
  end

  test "should get new" do
    get trainees_new_url
    assert_response :success
  end

  test "should get edit" do
    get trainees_edit_url
    assert_response :success
  end
end
