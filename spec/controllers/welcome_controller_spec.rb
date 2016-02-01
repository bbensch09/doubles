require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  let(:first_time_user){FactoryGirl.create(:first_login_user)}
  let(:returning_user){FactoryGirl.create(:user)}


  describe "GET index" do
    context "with a first time user" do
      it "redirects to profile page" do
        login_with first_time_user
        get 'index'
        expect(response).to redirect_to '/profile'
      end
    end
    context "with a returning user" do
      it "redirects to the user's feed" do
        login_with returning_user
        get 'index'
        expect(response).to redirect_to '/feed'
      end
    end
    context "with no user logged in" do
      it "should render the index page" do
        login_with nil
        get 'index'
        expect(response).to render_template( :'welcome/index' )
      end
    end
  end
end
