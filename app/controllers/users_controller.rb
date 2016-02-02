class UsersController < ApplicationController
  before_action :login_user, :except => [:create]

  def create
    oAuth_info = request.env["omniauth.auth"]
  end

  def show
    @displayed_user = User.find(params[:id])
    @sports = @displayed_user.activities
  end

  def profile
    @user = current_user

    unless @user.activity_blurbs.length > 0
      already_chosen_activities = @user.activities
      @all_sports = Activity.all - already_chosen_activities
      @activity_blurb = ActivityBlurb.new
      flash[:show_modals] = true
      # To be refactored
      if flash[:modals_to_show]
        flash[:modals_to_show].push('/users/pick_sports')
      else
        flash[:modals_to_show] = ['/users/pick_sports']
      end
    end

    unless @user.bio
      flash[:show_modals] = true
      # If there is already something to show, add to the array
      # Otherwise, just create the array of length = 1
      # To be refactored
      if flash[:modals_to_show]
        flash[:modals_to_show].push('/users/add_bio')
      else
      flash[:modals_to_show] = ['/users/add_bio']
      end
    end
  end

  def edit_profile
    @user = current_user
  end

  def finish_profile
    @user = current_user
  end

  def update
    @user = current_user
    if request.xhr?
      @user.update(bio: params[:bio])
      puts 'success!!!!!!!!!!!!!!!!!!'
      render json: @user
    elsif @user.update(profile_update_params)
      redirect_to '/feed'
    else
      p "could not save updates"
      render 'edit'
    end
  end

  def complete_walkthrough
    session[:walkthrough_status] = 'completed'
    puts "walkthrough status now completed"
    redirect_to '/feed'
  end

  def profile_update_params
    params.require(:user).permit(:first_name, :last_name, :bio, :age, :gender, :profile_picture_url, :email)
  end

end
