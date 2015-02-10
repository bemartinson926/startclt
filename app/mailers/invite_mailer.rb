class InviteMailer < ActionMailer::Base
  default from: "codepilotes@gmail.com"

  def invite_email(group, user, invite)
    @group  = group
    @user   = user
    @invite = invite
    mail(to: @invite.email, subject: "You have been invited to join #{@group.name}!", template_path: 'mailers/invite_mailer')
  end
end