require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user1) { FactoryGirl.create(:user)}
  before do
    DatabaseCleaner.clean
    login_with(user1)
  end

  context "show action" do
    let(:num){User.last.id}
    it "should assign @displayed_user variable" do
      get :show, :id => num
      expect(assigns(:displayed_user)).to be_a(User)
    end
    it "should assign @sports variable" do
      get :show, :id => num
      expect(assigns(:sports)).to_not be_nil
    end
    it "should render show view" do
      get :show, :id => num
      expect( response ).to render_template( :'users/show' )
    end
  end

  context "profile action" do
    it "should assign @user variable" do
      get :profile
      expect(assigns(:user)).to be_a(User)
    end
    it "should render profile view" do
      get :profile
      expect(response).to render_template(:'users/profile')
    end
  end

end
