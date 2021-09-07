require 'test_helper'

class FavoretesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favoretes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favoretes_destroy_url
    assert_response :success
  end

end
