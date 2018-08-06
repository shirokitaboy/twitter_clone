require 'test_helper'

class TwtrsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twtrs_index_url
    assert_response :success
  end

end
