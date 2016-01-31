class ConversationsController < ApplicationController
  def create

  end

  def show
    # get the matched user's info
    @match = Match.find(params[:id])
    if @match.first_user_id == current_user.id
      @matched_user = @match.second_user
    elsif @match.second_user_id == current_user.id
      @matched_user = @match.first_user
    end
  end
end
