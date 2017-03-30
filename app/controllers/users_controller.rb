class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.find(params[:id])
    end
    
    
    def index
        @userall = User.includes(:profile)
        @user = User.find(current_user.id)
        @profile = @user.profile
        if @profile
            ## send to Community Page
        else
            flash[:notice] = "Please create your profile to view DevMatch Community."
            redirect_to root_url
        end
    end
end