class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    user_hash = request.env['omniauth.auth'].to_yaml
    p "----------\n USER HASH IS:"
    p user_hash
    p "-----------"
    begin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.email}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated

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
    puts "error with sign in"
    redirect_to root_path
  end
end
