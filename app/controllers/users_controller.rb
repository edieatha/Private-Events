class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @invitations = @user.invitations
    @attended_events = current_user.attended_events
    @past_events_attended = Event.past_events
  end

  def index
    @created_events = current_user.events
    @attended_events = current_user.attended_events
  end
end
