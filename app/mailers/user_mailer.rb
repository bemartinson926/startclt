class UserMailer < ActionMailer::Base
  default from: "codepilotes@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to StartCharlotte', template_path: 'user_mailer' )
  end
end