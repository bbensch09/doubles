class SwipesController < ApplicationController
    before_action :authenciate_user!

      # POST /api/swipes
    def create
      swipee_id = params[:swipee_id]
      new_swipe = current_user.swipes.new(swipee_id: swipee_id, swiped_yes: params[:swiped_yes])
      new_swipe.save

      if User.find(swipee_id).swipes.where(swipee_id: current_user.id, swiped_yes: true)
        current_user.matches.new()
      end
      # input: swiper_id, swipee_id
      # create instance of swiper
      # if match, return JSON
        ## how to show match/no-match?
      # else return JSON
        ## how to show match/no-match?
    end

    def feed
      # p current_user
      # p current_user.narrow_users

      # send all unswiped users near you with shared activity
      # @available_users = current_user.narrow_users

      # send just first unswiped user near you with shared act...
      @next_available_user = current_user.narrow_users.first
    end

    def swipe_yes
      new_swipe = current_user.swipes.create(swipee_id: params[:user_id], swiped_yes: true)
      if ( User.find(params[:user_id]).swipes.where(swipee_id: current_user.id, swiped_yes: true).length > 0 )
        @matched_user = User.find(params[:user_id])
        render '/matches/overlay' and return
      else
        redirect_to "/feed"
      end
    end

    def swipe_no
      current_user.swipes.create(swipee_id: params[:user_id],swiped_yes: false)
      redirect_to "/feed"
    end
end
