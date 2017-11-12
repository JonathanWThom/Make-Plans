class EventsController < ApplicationController
  def new
  end

  def create
    @event = Event.create(event_params)
    if event.valid?
      activity = Activity.find(activity_params[:activity])
      update_activity(event, activity)
      invitation = Invitation.create(
        event_id: event.id, activity_id: activity.id, user_email: event.invitee_email
      )
      invitation.users << current_user
      invitation.pending_invitations.create(user_email: event_params[:user_email])
      InvitationEmailMailer.invitation_email(current_user, event_params[:user_email], invitation).deliver_later
      redirect_to root_path
    else
      respond_to do |format|
        format.js { render layout: false }
      end
    end
  end

  private

  attr_reader :event

  def event_params
    params.require(:event).permit(
      :happening_at_string,
      :location,
      :user_id,
      :invitee_email
    )
  end

  def activity_params
    params.permit(:activity)
  end

  def update_activity(event, activity)
    if activity.happening_at_string != event.happening_at_string
      activity.update(happening_at_string: event.happening_at_string)
    end
  end
end
