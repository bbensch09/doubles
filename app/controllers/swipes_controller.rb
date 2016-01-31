class SwipesController < ApplicationController
	    # POST /api/swipes
    def create
      swipee_id = params[:swipee_id]
      new_swipe = current_user.swipes.new(swipee_id: swipee_id, swiped_yes: params[:swiped_yes])
      new_swipe.save

      if User.find(swipee_id).swipes.where(swipee_id: current_user.id, swiped_yes: true)
        current_user.matches.new()
      end

      render :text => "Create swipe"
      # input: swiper_id, swipee_id
      # create instance of swiper
      # if match, return JSON
        ## how to show match/no-match?
      # else return JSON
        ## how to show match/no-match?
    end

    def show
      render :text => "Page to swipe people"
    end
end
