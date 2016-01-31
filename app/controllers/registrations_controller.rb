class RegistrationsController < Devise::RegistrationsController

  def show_tutorial
    render 'users/step4'
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
