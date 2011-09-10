class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def send_user_message(name, email, message)
    @user_name = name
    @user_email = email
    @user_message = message
    mail(:to => 'eliseu.martinho@gmail.com', :subject => "Message for Helen Gruber from a friendly user that has just visited her website") do |format|
      format.html { render 'user_message.html' }
    end
  end

end
