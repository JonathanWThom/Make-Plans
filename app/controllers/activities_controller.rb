class ActivitiesController < ApplicationController
  expose :user
  def create
    user.activities.create(activity_params)
    redirect_to user_path(user)
  end

  private

  def activity_params
    params.require(:activity).permit(:title)
  end
end
