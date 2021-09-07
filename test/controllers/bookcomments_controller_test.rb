require 'test_helper'

class BookcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bookcomments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bookcomments_destroy_url
    assert_response :success
  end

end
