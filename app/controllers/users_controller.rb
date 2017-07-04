class UsersController < ApplicationController
  expose :user

  def show
    @pending_invitations = PendingInvitation.where(user_email: user.email)
  end

end
