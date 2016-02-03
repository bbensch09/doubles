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
      flash[:required_modal] = true
      p "-------bio modal set--------"
      # render 'profile'

    elsif @user.activities.empty?
      flash[:show_modal] = true
      flash[:modal_to_show] = '/users/pick_sports'
      flash[:required_modal] = true
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
      @user.update(bio: params[:bio]) if params[:bio]
      @user.update(latitude: params[:lat], longitude: params[:lng]) if params[:lat]
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

end
