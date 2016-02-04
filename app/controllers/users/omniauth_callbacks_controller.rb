class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include WelcomeHelper

  def facebook
    auth = request.env['omniauth.auth']
    # @user = User.find_for_facebook_oauth
    if @user = User.where(email:auth.info.email).first
      # sign_in_and_redirect_to root_path @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      sign_in(@user)
      redirect_to '/feed'
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider'])
      p user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      p user.first_name = auth.info.first_name
      p user.last_name = auth.info.last_name
      p user.profile_picture_url = auth.info.image
      p user.gender = auth.extra.raw_info.gender
      p user.uid = auth.uid
      if auth.extra.raw_info.birthday
        birthday_string = auth.extra.raw_info.birthday
        birthday = Date.strptime(birthday_string,"%m/%d/%Y")
        now = Time.now.to_date
        age = now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
        user.age = age
        if age == 0
          user.age = nil
        end
      else
        user.age = nil
      end

      # if auth.extra.raw_info.location
      #   p user.location = auth.extra.raw_info.location.name
      # else
      #   user.location = "unknown"
      # end
      p user.save!
      @user = user
      p "---------USER CREATED?"
      p "the user from FB Data is #{user}"
      p session[:user_id] = user.id
      # flash[:success] = "Welcome, #{user.email}!"
      current_user = @user

      sign_in(user)
      # @activity_blub = ActivityBlurb.new
      redirect_to "/profile"
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
