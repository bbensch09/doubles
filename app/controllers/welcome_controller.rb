class WelcomeController < ApplicationController

  def index
    if current_user && current_user.sign_in_count == 1
      redirect_to "/users/#{current_user.id}/profile"
    elsif current_user && current_user.sign_in_count > 1
      redirect_to "/users/#{current_user.id}/feed"
    else
      render 'index'
    end
  end
end
