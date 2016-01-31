class ActivityBlurbsController < ApplicationController
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
      @activity_blurb = ActivityBlurb.new(activity_id: params[:activity_id], text: params[:text], user_id: @user.id)
      @activity_blurb.user_id = current_user.id if current_user
      if @activity_blurb.save
        render json: @activity_blurb
      else
        render json: @activity_blurb
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
