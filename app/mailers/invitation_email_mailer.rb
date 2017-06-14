class InvitationEmailMailer < ApplicationMailer
  default from: "makeplans@hello.com"

  def invitation_email(user, invitee_email)
    @user = user
    mail(to: invitee_email, subject: "Let's make plans!")
  end
end
