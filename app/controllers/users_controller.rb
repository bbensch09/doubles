class UsersController < ApplicationController
  before_action :login_user, :except => [:create]

  def create
    oAuth_info = request.env["omniauth.auth"]
  end

  def show
    @user = User.find(params[:id])
    @sports = @user.activities
    p "="*30
    p @user
    p @sports
  end

  def profile
    @user = current_user
    @already_chosen_activities = @user.activities
    @all_sports = Activity.all - @already_chosen_activities
    @activity_blurbs = @user.activity_blurbs
    @activity_blurb = ActivityBlurb.new
    @first_visit = current_user.sign_in_count == 1
    render 'profile'
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
      @user.update(bio: params[:bio]) if params[:bio]
      @user.update(latitude: params[:lat], longitude: params[:lng]) if params[:lat]
      @user.update(bio: params[:bio], age: params[:age], first_name: params[:first_name]) if params[:bio]
      render json: @user
    elsif @user.update(profile_update_params)
      p "updating zipcode"
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

  def add_zipcode
    if current_user.zipcode
      current_user.lat_lng_by_zipcode
      render :text => "true"
    else
      render partial: 'users/enter_zipcode'
    end
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
    @first_visit = current_user.sign_in_count == 1
  end

end
