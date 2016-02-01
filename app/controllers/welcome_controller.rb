class WelcomeController < ApplicationController

  def index



    if current_user && current_user.sign_in_count == 1
      if current_user.update_geolocation
        redirect_to "/profile"
      else
        flash[:show_modal] = true
        flash[:modal_to_show] = "zipcode"
        redirect_to "/profile"
      end

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
