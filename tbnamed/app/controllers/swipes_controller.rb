class SwipesController < ApplicationController
	    # POST /api/swipes
    def create
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
