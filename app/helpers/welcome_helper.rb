module WelcomeHelper
  def zip_code_modal
     flash[:show_modal] = true
     flash[:modal_to_show] = "/users/enter_zipcode"
  end
end
