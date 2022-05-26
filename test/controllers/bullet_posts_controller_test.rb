require "test_helper"

class BulletPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bullet_post = bullet_posts(:one)
  end

  test "should get index" do
    get bullet_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_bullet_post_url
    assert_response :success
  end

  test "should create bullet_post" do
    assert_difference("BulletPost.count") do
      post bullet_posts_url, params: { bullet_post: { name: @bullet_post.name } }
    end

    assert_redirected_to bullet_post_url(BulletPost.last)
  end

  test "should show bullet_post" do
    get bullet_post_url(@bullet_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_bullet_post_url(@bullet_post)
    assert_response :success
  end

  test "should update bullet_post" do
    patch bullet_post_url(@bullet_post), params: { bullet_post: { name: @bullet_post.name } }
    assert_redirected_to bullet_post_url(@bullet_post)
  end

  test "should destroy bullet_post" do
    assert_difference("BulletPost.count", -1) do
      delete bullet_post_url(@bullet_post)
    end

    assert_redirected_to bullet_posts_url
  end
end
