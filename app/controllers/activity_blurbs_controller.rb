class ActivityBlurbsController < ApplicationController
    before_action :login_user

    def index
      @activity_blurbs = current_user.activity_blurbs
      @activity_blurb = ActivityBlurb.new
    end

    def new
      @user = current_user
      already_chosen_activities = @user.activities
      @all_sports = Activity.all - already_chosen_activities
      @activity_blurb = ActivityBlurb.new
      flash[:show_modal] = true
      flash[:modal_to_show] = '/users/pick_sports'
      flash[:required_modal] = true
      redirect_to '/profile'
    end

    def create
      @user = current_user
      @activity_blurb = ActivityBlurb.create(activity_id: params[:activity_id], text: params[:text], user_id: @user.id)

      if request.xhr?
        flash.discard(:show_modal)
        render json: @activity_blurb
      else
        if @activity_blurb.save
          redirect_to '/profile'
        else
          @errors = @activity_blurb.errors
          # redirect_to activity_blurbs_path
          redirect_to '/profile'
        end
      end
    end

    def show
      @activity_blurbs = current_user.activity_blurbs
      render 'show'
    end

    def destroy
      @activity_blurb = ActivityBlurb.find(params[:sports_blurb_id])
      @activity_blurb.destroy
      render json: 'Success'
    end

    def activity_params
    params.require(:activity_blurb).permit(:activity_id, :text, :user_id)
    end
end
