class ConversationsController < ApplicationController
  def create
    render :text => "Create conversation"
  end

  def show
    render :text => "Conversation show page"
  end
end
