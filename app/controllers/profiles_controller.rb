class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
    def new
        @profile = Profile.new
    end
    def edit
        @user = User.find(params[:user_id])
        @profile = @user.profile
    end
    
    def update
        @user = User.find(params[:user_id])
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:notice] = "Profile Updated Successfully."
            redirect_to user_url(id: current_user)
        else
            redirect_to action :edit
        end
    end
    
    def create 
        @user = User.find(params[:user_id])
        @profile = @user.build_profile( profile_params )
        if @profile.save
            flash[:notice] = "Profile Created Successfully!"
            redirect_to user_url(id: current_user)
        else
            render action :new
        end
    end
    private 
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
        def only_current_user
            @user_id = User.find(params[:user_id]).id
            unless @user_id == current_user.id
            redirect_to root_path 
            end
        end
end
