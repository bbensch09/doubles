class WelcomeController < ApplicationController
  include WelcomeHelper

  def index
    # first time user
    if current_user && current_user.sign_in_count == 1
        redirect_to "/profile"
    # user not registered
    else
      render 'index', :layout => false
    end
  end

  def force_login
    render 'force_login'
  end

  def iframe
    render 'iframe', :layout => false
  end

  def iframe_source
    render 'index', :layout => false
  end

end
