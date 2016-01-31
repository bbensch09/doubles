include MatchesHelper

class ConversationsController < ApplicationController
  def create

  end

  def show
    # get the matched user's info
    @match = Match.find(params[:id])
    @matched_user = get_matched_user(@match, current_user)
  end
end