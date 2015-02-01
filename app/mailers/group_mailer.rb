class GroupMailer < ActionMailer::Base
  default from: "codepilotes@gmail.com"

  def group_create_email(group, user)
    @group = group
    @user = user
    mail(to: @user.email, subject: "Thanks for starting a new group!", template_path: 'mailers/group_mailer')
  end

  def group_join_email(group, user)
    @group = group
    @user = user
    mail(to: @user.email, subject: "Thanks for joining the group!", template_path: 'mailers/group_mailer')
  end
end