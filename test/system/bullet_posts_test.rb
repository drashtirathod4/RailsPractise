require "application_system_test_case"

class BulletPostsTest < ApplicationSystemTestCase
  setup do
    @bullet_post = bullet_posts(:one)
  end

  test "visiting the index" do
    visit bullet_posts_url
    assert_selector "h1", text: "Bullet posts"
  end

  test "should create bullet post" do
    visit bullet_posts_url
    click_on "New bullet post"

    fill_in "Name", with: @bullet_post.name
    click_on "Create Bullet post"

    assert_text "Bullet post was successfully created"
    click_on "Back"
  end

  test "should update Bullet post" do
    visit bullet_post_url(@bullet_post)
    click_on "Edit this bullet post", match: :first

    fill_in "Name", with: @bullet_post.name
    click_on "Update Bullet post"

    assert_text "Bullet post was successfully updated"
    click_on "Back"
  end

  test "should destroy Bullet post" do
    visit bullet_post_url(@bullet_post)
    click_on "Destroy this bullet post", match: :first

    assert_text "Bullet post was successfully destroyed"
  end
end
