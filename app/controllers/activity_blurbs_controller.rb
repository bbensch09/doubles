class ActivityBlurbsController < ApplicationController
    before_action :login_user

    def index
      @activity_blurbs = current_user.activity_blurbs
      @activity_blurb = ActivityBlurb.new
    end

    def new
      @all_sports = Activity.all
      @activity_blurb = ActivityBlurb.new
    end

    def create
      @user = current_user
      @activity_blurb = ActivityBlurb.new(activity_id: params[:activity_blurb][:activity_id], text: params[:activity_blurb][:text], user_id: @user.id)

      if request.xhr?
        render json: @activity_blurb
      else
        if @activity_blurb.save
          redirect_to activity_blurbs_path
        else
          @errors = @activity_blurb.errors
          redirect_to activity_blurbs_path
        end
      end
    end

    def show
      @activity_blurbs = current_user.activity_blurbs
      render 'show'
    end

    def destroy
      @activity_blurb = ActivityBlurb.find(params[:id])
      @activity_blurb.destroy
      redirect_to edit_user_registration_path
    end

    def activity_params
    params.require(:activity_blurb).permit(:activity_id, :text, :user_id)
    end
end
