class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_user
    # set current time to the user's last page view
    update_last_pageview
    redirect_to '/login' unless user_signed_in?
  end


  private

  def update_last_pageview
    p "pageview!"
  end
end
