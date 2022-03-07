require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get users_index_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get users_show_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get users_new_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get users_edit_url
  #   assert_response :success
  # end

  def setup
    @user = User.new(email: "drashti@mail.com", name: "Drashti", password: "drashti")
  end

  test "should get index" do
    get users_path
    assert_response :success
  end 

  test "should get new" do
    get new_user_path
    assert_response :success
  end
  
  test "should create user" do
    assert_difference("User.count") do
      post users_path, params: {user: {email: @user.email, name: @user.name}}
    end
    assert_redirected_to user_path(User.last)
  end
end
