include MatchesHelper

class ConversationsController < ApplicationController
  def create

  end

  def show
    # get the matched user's info
    @match = Match.find(params[:id])
    @matched_user = get_matched_user(@match, current_user)
    @presenter = generate_presenter
    if request.xhr?
      render :json => generate_presenter
    end
  end

  private

  def generate_presenter
    return {
          :messages => Message.where(match_id: @match.id).order('created_at ASC'),
          :form => {
            :action => "/matches/#{@match.id}/chat",
            :csrf_param => request_forgery_protection_token,
            :csrf_token => form_authenticity_token
          }
        }
  end
end