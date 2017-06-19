class UsersController < ApplicationController
  expose :user

  def show
    @activity = user.activities.new
    @pending_invitations = PendingInvitation.where(user_email: user.email)
  end

end
