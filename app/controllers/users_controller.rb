class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @invitations = @user.invitations
    # @upcoming_events = current_user.events.upcoming
    # @previous_events = current_user.events.previous
  end
end
