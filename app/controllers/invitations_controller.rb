class InvitationsController < ApplicationController
  def show
    session[:invitation] = params
  end
end
