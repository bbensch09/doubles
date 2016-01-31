class UsersController < ApplicationController
  def create
    oAuth_info = request.env["omniauth.auth"]
    p oAuth_info
    render :text => "Create user sports and things"
  end

  def show
    @displayed_user = User.find(params[:id])
    @sports = @displayed_user.activities
  end
end
