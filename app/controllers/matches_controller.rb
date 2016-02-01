class MatchesController < ApplicationController
    before_action :login_user

    # respond_to :json
    # GET api/matches
    def index
      #return JSON of a user's matches profile information
      # render :text => "Match index"

      #THIS SHOULD PROBABLY BE MOVED TO MODEL
      # user = User.find(1)
      # match_ids = []
      # user.first_user_matches.each do |match|
      #   match_ids << match.second_user_id
      # end
      # user.second_user_matches.each do |match|
      #   match_ids << match.first_user_id
      # end
      # @matches = []
      # match_ids.each do |id|
      #   @matches << User.find(id)
      # end
      # render 'index'

      if current_user
        @matches = current_user.matches
        render 'index'
      else
      end
      # user = User.find(2) #need to pull user_id from Devise
      # respond_with user.matches
    end

    # GET api/matches/:id
    def show
      # Here is a new comment
      render :text => "Match show page"
      # This should lead into chat mode
      #return information needed for chat interface
      # respond_with Match.find(params[:id])
    end
end
