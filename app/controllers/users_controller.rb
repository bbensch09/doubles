class UsersController < ApplicationController
  def create
    oAuth_info = request.env["omniauth.auth"]
    p oAuth_info
    render :text => "Create user sports and things"
  end
end
