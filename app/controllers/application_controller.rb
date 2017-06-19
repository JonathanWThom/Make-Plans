class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if session[:invitation]
      invitation = Invitation.find_by_uuid(session[:invitation]["uuid"])
      invitation_path(invitation)
    else
      user_path(current_user)
    end
  end
end
