require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  def setup
  end

  #test "should route to sessions new" do
  #  assert_routing({:path=>"sessions/new", :method => :get }, 
  #  {:controller=>"sessions", :action=>"new"})#, {}, {}, 'Route not generated properly'
  #end
 
  test "should route to sessions new login" do
    assert_routing({:path=>"log_in", :method => :get }, 
    {:controller=>"sessions", :action=>"new"})#, {}, {}, 'Route not generated properly'
  end

  test "should route to sessions destroy logout" do
    assert_routing({:path=>"log_out", :method => :get }, 
    {:controller=>"sessions", :action=>"destroy"})#, {}, {}, 'Route not generated properly'
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
