require 'rails_helper'

RSpec.describe SwipesController, :type => :controller do
  DatabaseCleaner.clean
  let(:user1) { FactoryGirl.create(:user)}
  before do
    DatabaseCleaner.clean
    login_with(user1)
  end
  after(:each) do
    DatabaseCleaner.clean
  end

  context "with user logged in" do

    it "should have a current_user" do
      expect(controller.current_user).to_not eq(nil)
    end

    it "should return current_user's properties" do
      expect(controller.current_user.first_name).to be_a String
      expect(controller.current_user.last_name).to be_a String
      expect(controller.current_user.email).to be_a String
    end



    context "when user goes to swipes page" do
      it "should be able to route to feed action" do
        expect(:get => "feed").
        to route_to(:controller => "swipes", :action => "feed")
      end
      it "should render feed view" do
        get 'feed'
        expect(response).to redirect_to 'http://test.host/walkthrough'
      end
      # it "should asign next user to instance variable" do
      #   get 'feed'
      #   expect(assigns(:next_available_user)).to be_a(User)
      # end
    end

    context "when user swipes yes" do
      context "when no match is made" do
        it "redirects to feed" do
          user = User.create(first_name:"gregg", last_name: "gregg", email: "gregg@g.com", password:"password", profile_picture_url: "asdf")
          num = User.last.id
          get 'swipe_yes', {user_id: 2}
          expect(response).to redirect_to '/feed'
        end
      end
      context "when a match is made" do
        it "renders match overlay" do
          user = User.create(first_name:"gregg", last_name: "gregg", email: "gregg@g.com", password:"password", profile_picture_url: "asdf")
          user.swipes.create(swipee_id:1, swiped_yes: true)
          get 'swipe_yes', {user_id: 2}
          expect(response).to render_template 'matches/overlay'
        end
      end
    end
      # move method to model and test there
      # it "should create a swipe" do
      # end
  end
end
