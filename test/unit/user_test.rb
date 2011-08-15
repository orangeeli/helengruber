require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # called before every single test
  def setup
    @admin_login = 'admin'
    @admin_password = 'test_1'
  end
 
  # called after every single test
  def teardown
  end

  test "should not save post without password and login" do
    user = User.new
    assert !user.save
  end

  test "password salt should be the same" do
    user_admin = users(:admin)
    user_admin.password = 'test_2'
    user_admin.encrypt_password

    assert_equal user_admin.password_hash, BCrypt::Engine.hash_secret('test_2', user_admin.password_salt), 'Password salt should be the same'
  end
 
  test "should not have two users with the same login" do
    temp_user_1 = User.new #(:name => 'test_1', :login => 'test_1', :password => 'temp', :email => 'temp_1@example.com')

    temp_user_1.name = 'test_1'
    temp_user_1.login = 'test_1'
    temp_user_1.password = 'test_1'
    temp_user_1.email = 'temp_1@example.com'

    assert temp_user_1.save, "User with the same login already exists"

    temp_user_2 = User.new(:name => 'test_2', :login => 'test_2', :password => 'temp', :email => 'temp_2@example.com')
    assert !temp_user_2.save
  end 
 
  test "test user should authenticate" do
    assert User.authenticate(@admin_login, @admin_password), 'Could not authenticate user'
  end  

  test "test user should not authenticate" do
    assert !User.authenticate(@admin_login, nil), 'User authenticated'
  end 

end
