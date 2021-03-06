require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
  def test_send_user_message
    user = users(:admin)
 
    # Send the email, then test that it got queued
    email = UserMailer.send_user_message(user.name, user.email, 'hello world message').deliver
    assert !ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    #assert_equal [user.email], email.to
    assert_equal "Message for Helen Gruber from a friendly user that has just visited her website", email.subject
    assert_match /<h1>User #{user.name} says<\/h1>/, email.encoded
    assert_match /hello world message/, email.encoded
  end
  
end
