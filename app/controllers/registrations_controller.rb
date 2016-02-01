class RegistrationsController < Devise::RegistrationsController
  before_action except: [:show_tutorial] do
    redirect_to '/login' unless current_user
  end

  # HACKY_SHIT
  # temp action to test tutorial slider
  def show_tutorial
    render 'users/walkthru'
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :bio, :age, :gender, :profile_picture_url, :email, :password, :password_confirmation)
  end


  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :bio, :age, :gender, :profile_picture_url, :email)
  end
end
