class UsersController < ApplicationController
  expose :user

  def show
    @activity = user.activities.new
  end

end
