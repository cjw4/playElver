require 'test_helper'

class ScorecardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
