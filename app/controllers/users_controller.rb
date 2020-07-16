class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @invitations = @user.invitations
    @created_events = current_user.events
    @attending_events = current_user.attended_events
    @attended_events = Event.past_events
  end
end
