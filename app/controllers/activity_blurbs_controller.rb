class ActivityBlurbsController < ApplicationController
    def index
      @activity_blurbs = current_user.activity_blurbs
      @activity_blurb = ActivityBlurb.new
    end

    def new
      @activity_blurb = ActivityBlurb.new
    end

    def create
      @activity_blurb = ActivityBlurb.new(activity_params)
      @activity_blurb.user_id = current_user.id if current_user
      if @activity_blurb.save
        redirect_to activity_blurbs_path
      else
        render 'new'
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
