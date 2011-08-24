require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  def setup
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get new session" do
    post :create, :email => 'admin', :password => 'test_1'
    assert_redirected_to root_url
    assert_equal 'Logged in!', flash[:notice]
  end

  test "should destroy session" do
    get :destroy
    assert_redirected_to root_url
    assert_equal 'Logged out!', flash[:notice]
  end

end
