class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def send_user_message(name, email, message)
    @user_name = name
    @user_email = email
    @user_message = message
    mail(:to => 'mail@helengruber.de', :subject => "Message from my awsome website") do |format|
      format.html { render 'user_message' }
    end
  end

end
