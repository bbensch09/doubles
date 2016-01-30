class SessionsController < Devise::SessionsController

  def create
    user_hash = request.env['omniauth.auth'].to_yaml
    p user_hash
    begin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.email}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

end
