include MatchesHelper

class ConversationsController < ApplicationController
  before_action :login_user

  def create
    match = Match.find(params[:id])
    Message.create(
        match_id: match.id,
        message_text: params[:text],
        user_id: params[:author],
        recipient_id: get_matched_user(match, current_user).id,
        unread: true
        )
    presenter = generate_presenter( {match_id: match.id, sender_id: params[:author]} )
    render :json => presenter
  end

  def show
    # get the matched user's info
    @match = Match.find(params[:id])
    @matched_user = get_matched_user(@match, current_user)
    @presenter = generate_presenter( {match_id: @match.id, sender_id: current_user.id} )
    if request.xhr?
      render :json => generate_presenter( {match_id: @match.id, sender_id: current_user.id} )
    end
  end

  private

  def generate_presenter(options)
    match = Match.find( options.fetch(:match_id) )
    sender = User.find( options.fetch(:sender_id) )
    matched_user = get_matched_user(match, sender)
    raw_messages = Message.where(match_id: match.id).order('created_at ASC')

    # mark messages as read once they're sent to the user
    raw_messages.each do |message|
      if current_user.id != message.user_id
        p message
        message.unread = false
        message.save
      end
    end

    formatted_messages = []
    raw_messages.each do |message|
      formatted_messages << {
        id: message.id,
        message_text: message.message_text,
        created_at: message.created_at,
        css_class: current_user.id == message.user_id ? "message-right" : "message-left",
        css_bubble: current_user.id == message.user_id ? "bubble2" : "bubble3"
      }
    end

    return {
          :messages => formatted_messages,
          :form => {
            :action => "/matches/#{match.id}/chat",
            :csrf_param => request_forgery_protection_token,
            :csrf_token => form_authenticity_token,
            :sender_id => sender.id,
            :matched_user_id => matched_user.id
          }
        }
  end
end
