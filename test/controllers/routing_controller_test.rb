require 'test_helper'

class RoutingControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
