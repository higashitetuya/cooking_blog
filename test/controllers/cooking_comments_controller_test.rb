require 'test_helper'

class CookingCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cooking_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cooking_comments_destroy_url
    assert_response :success
  end
end
