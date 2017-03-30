class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.find(params[:id])
    end
    
    
    def index
        @user = User.find(current_user.id)
        @profile = @user.profile
        if @profile
            ## send to Community Page
            if @user.plan_id == 1
                flash[:success] = "Basic Account: You will not be able to see contact details of DevMatch Community People."
            else
                flash[:notice] = "Welcome to DevMatch Community."
            end
        else
            flash[:notice] = "Please create your profile to view DevMatch Community."
            redirect_to root_url
        end
    end
end