class UsersController < ApplicationController
  before_action except: [:create] do
    redirect_to '/login' unless current_user
  end
  
  def create
    oAuth_info = request.env["omniauth.auth"]
    p oAuth_info
  end

  def show
    @displayed_user = User.find(params[:id])
    @sports = @displayed_user.activities
  end

  def profile
    @user = current_user
  end

end
