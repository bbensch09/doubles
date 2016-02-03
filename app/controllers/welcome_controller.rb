class WelcomeController < ApplicationController
  include WelcomeHelper

  def index
    # first time user
    if current_user && current_user.sign_in_count == 1
        redirect_to "/profile"
    # user not registered
    else
      render 'index'
    end
  end

  def force_login
    render 'force_login'
  end

end
