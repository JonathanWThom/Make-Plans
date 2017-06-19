class InvitationsController < ApplicationController
  def show
    session[:invitation] = params
    @invitation = Invitation.find_by_uuid(params[:uuid])
  end

  def rsvp
    invitation = Invitation.find_by_uuid(params[:uuid])
    invitation.users << current_user
    flash[:notice] = "Congrats, you've made plans!"
    redirect_to root_path
  end
end
