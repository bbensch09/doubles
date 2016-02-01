class WelcomeController < ApplicationController

  def index

    if current_user && current_user.sign_in_count == 1
      redirect_to "/profile"
      elsif current_user && current_user.sign_in_count > 1
      redirect_to "/feed"
      else
      render 'index'
    end
  end

  def force_login
    render 'force_login'
  end

end