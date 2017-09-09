class UsersController < ApplicationController
  expose :user

  def show
    @pending_invitations = PendingInvitation.where(user_email: user.email)
  end

  def set_user_location
    latitude = params[:location][:latitude]
    longitude = params[:location][:longitude]
    user.update(
      latitude: latitude,
      longitude: longitude
    )
    render plain: params[:location]
  end

end
