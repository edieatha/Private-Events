class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @invitations = @user.invitations
    end
end
