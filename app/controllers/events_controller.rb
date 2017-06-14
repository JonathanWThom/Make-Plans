class EventsController < ApplicationController
  def create
    event = Event.create(event_params)
    if event.valid?
      activity = Activity.find(activity_params[:activity])
      Invitation.create(event_id: event.id, activity_id: activity.id)
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
end
