require "test_helper"

class Public::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_posts_show_url
    assert_response :success
  end
end
