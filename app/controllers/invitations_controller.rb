class InvitationsController < ApplicationController
  def show
    session[:invitation] = params
    @invitation = Invitation.find_by_uuid(params[:uuid])
  end

  def rsvp
    invitation = Invitation.find_by_uuid(params[:uuid])
    invitation.users << current_user
    invitation.pending_invitations.where(user_email: current_user.email).first.destroy
    flash[:notice] = "Congrats, you've made plans!"
    redirect_to user_path(current_user)
  end
end
