class UsersController < ApplicationController
  def create
    otouch Auth_info = request.env["omniauth.auth"]
    p oAuth_info
    render :text => "Create user sports and things"
  end
end
