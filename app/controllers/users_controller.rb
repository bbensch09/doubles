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
    already_chosen_activities = @user.activities
    @all_sports = Activity.all - already_chosen_activities
    @activity_blurb = ActivityBlurb.new

    if flash[:show_modal]
      render 'profile'
      p "-------modal was true; profile rendered--------"
    elsif  @user.bio.nil?
      flash[:show_modal] = true
      flash[:modal_to_show] = '/users/add_bio'
      p "-------bio modal set--------"
      # render 'profile'

    elsif @user.activities.empty?
      flash[:show_modal] = true
      flash[:modal_to_show] = '/users/pick_sports'
      p "-------activity modal set--------"
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
      current_user.update_lat_lng
      puts 'success!!!!!!!!!!!!!!!!!!'
      render json: @user
    elsif @user.update(profile_update_params)
      current_user.update_lat_lng
      redirect_to '/profile'
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
    params.require(:user).permit(:first_name, :last_name, :bio, :age, :gender, :profile_picture_url, :email, :zipcode)
  end

  def profile_test
    @user = current_user
    @already_chosen_activities = @user.activities
    @all_sports = Activity.all - @already_chosen_activities
    @activity_blurbs = @user.activity_blurbs
    @activity_blurb = ActivityBlurb.new
  end

end
