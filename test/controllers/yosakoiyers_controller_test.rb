require 'test_helper'

class YosakoiyersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yosakoiyers_index_url
    assert_response :success
  end

end
