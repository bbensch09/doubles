class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env['omniauth.auth']
    # @user = User.find_for_facebook_oauth
    if @user = User.where(email:auth.info.email).first
      # sign_in_and_redirect_to root_path @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      sign_in(@user)
      redirect_to root_path
    else
    session["devise.facebook_data"] = request.env["omniauth.auth"]
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    p user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    p user.first_name = auth.info.first_name
    p user.last_name = auth.info.last_name
    p user.profile_picture_url = auth.info.image
    p user.gender = auth.extra.raw_info.gender
    p user.age = auth.extra.raw_info.age_range.min[1]
    p user.location = auth.extra.raw_info.location.name
    p user.save!
    @user = user
    p "---------USER CREATED?"
    p "the user from FB Data is #{user}"
    p session[:user_id] = user.id
    p flash[:success] = "Welcome, #{user.email}!"
    current_user = @user
    sign_in(user)
    redirect_to edit_user_registration_url
    end

  end

# EXTRA VALIDATION FOUND IN omniauth-facebook gem
    # if @user.persisted?
    #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    # else
    #   session["devise.facebook_data"] = request.env["omniauth.auth"]
    #   redirect_to new_user_registration_url
    # end
  # end

  def failure
    puts "----------error with sign in"
    redirect_to root_path
  end
end
