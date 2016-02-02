class SwipesController < ApplicationController
    before_action :login_user

      # POST /api/swipes
    def create
      case params[:type]
        when "yes"
          swipe_yes
        when "no"
          swipe_no
      end
    end

    def feed
      # p current_user
      # p current_user.narrow_users

      # send all unswiped users near you with shared activity
      # @available_users = current_user.narrow_users

      # send just first unswiped user near you with shared act...
      if current_user.bio.nil?
        redirect_to '/finish_profile'
      elsif
        unless session[:walkthrough_status] || current_user.swipes.count > 0
          redirect_to '/walkthrough'
        end
        # send just first unswiped user near you with shared act...
      else
        @next_five_users = current_user.narrow_users[0..4]
      end
    end

    private

    def swipe_yes
      new_swipe = current_user.swipes.create(swipee_id: params[:user_id], swiped_yes: true)
      match_found = User.find(params[:user_id]).swipes.where(swipee_id: current_user.id, swiped_yes: true).length > 0

      if request.xhr?
        render :text => match_found ? "match!" : "yes"
      else
        if matched_user
          @matched_user = User.find(params[:user_id])
          render '/matches/overlay' and return if match_found
        else
          redirect_to "/feed"
        end
      end
    end

    def swipe_no
      current_user.swipes.create(swipee_id: params[:user_id], swiped_yes: false)
      if request.xhr?
        render :text => "no"
      else
        redirect_to "/feed"
      end
    end
end
