class UserMailer < ActionMailer::Base
  default from: "codepilotes@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to StartCharlotte', template_path: 'mailers/user_mailer' )
  end
end