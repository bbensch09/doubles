class WelcomeController < ApplicationController
  include WelcomeHelper

  def index

    # first time user
    if current_user && current_user.sign_in_count == 1
      if current_user.update_lat_lng
        redirect_to "/profile"
      else
        zip_code_modal
        redirect_to "/profile"
      end
    # returning user
    elsif current_user && current_user.sign_in_count > 1
      if current_user.update_lat_lng
        redirect_to "/profile"
      else
        zip_code_modal
        redirect_to "/feed"
      end
    # not registered

    else
      render 'index'
    end

  end


  def force_login
    render 'force_login'
  end

end
