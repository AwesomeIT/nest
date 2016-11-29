require 'test_helper'

class ExperimentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experiments_index_url
    assert_response :success
  end

end
