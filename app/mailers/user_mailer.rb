class UserMailer < ActionMailer::Base
	default from: "codepilotes@gmail.com"

	def welcome_email(user)
		@user = user
		@url = 'http://techtalentsouth.com'
		mail(to: @user.email, subject: 'Welcome to StartCharlotte')
	end
end
