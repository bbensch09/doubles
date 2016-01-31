class UsersController < ApplicationController
  def create
    oAuth_info = request.env["omniauth.auth"]
    p oAuth_info
  end

  def show
    @displayed_user = User.find(params[:id])
    @sports = @displayed_user.activities
  end

  def profile
    @user = User.find(params[:id])
  end

end
