class EventsController < ApplicationController
  def create
    event = Event.create(event_params)
    if event.valid?
      activity = Activity.find(activity_params[:activity])
      invitation = Invitation.create(event_id: event.id, activity_id: activity.id)
      invitation.users << current_user
      InvitationEmailMailer.invitation_email(current_user, invitee_email[:invitee_email]).deliver_later
    else
      flash[:notice] = "You done messed up"
    end

    redirect_to user_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:date, :location, :user_id)
  end

  def activity_params
    params.permit(:activity)
  end

  def invitee_email
    params.permit(:invitee_email)
  end
end
