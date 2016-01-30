class MatchesController < ApplicationController
    # respond_to :json
    # GET api/matches
    def index
      #return JSON of a user's matches profile information
      user = User.find(2) #need to pull user_id from Devise
      respond_with user.matches
    end

    # GET api/matches/:id
    def show      
      # Here is a new comment
      # This should lead into chat mode
      #return information needed for chat interface
      respond_with Match.find(params[:id])
    end
end