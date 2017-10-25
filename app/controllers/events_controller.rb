class EventsController < ApplicationController
  def new
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      activity = Activity.find(activity_params[:activity])
      update_activity(event, activity)
      invitation = Invitation.create(event_id: event.id, activity_id: activity.id, user_email: invitee_email[:invitee_email])
      invitation.users << current_user
      invitation.pending_invitations.create(user_email: invitee_email[:invitee_email])
      InvitationEmailMailer.invitation_email(current_user, invitee_email[:invitee_email], invitation).deliver_later
    else
      flash[:notice] = "Something went wrong, please resubmit"
    end

    redirect_to user_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(
      :happening_at_string,
      :location,
      :user_id,
      invitation_attributes: [:user_email]
    )
  end

  def activity_params
    params.permit(:activity)
  end

  def update_activity(event, activity)
    ## this is broken
    if activity.happening_at_string != event.happening_at_string
      activity.update(happening_at_string: event.happening_at_string)
    end
  end
end
