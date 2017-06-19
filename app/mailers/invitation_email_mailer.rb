class InvitationEmailMailer < ApplicationMailer
  default from: "makeplans@hello.com"

  def invitation_email(user, invitee_email, invitation)
    @user = user
    @invitation_link = invitation_link(invitation)
    mail(to: invitee_email, subject: "Let's make plans!")
  end

  private

  def invitation_link(invitation)
    if Rails.env.development?
      "http://localhost:3000/invitations/#{invitation.uuid}"
    end
  end

end
