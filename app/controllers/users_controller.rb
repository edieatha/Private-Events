class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @invitations = @user.invitations
  end
end
