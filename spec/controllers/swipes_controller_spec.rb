require 'rails_helper'

RSpec.describe SwipesController, :type => :controller do
  before(:each) do
    login_with create(:first_user)
  end

  context "with user logged in" do

    it "should have a current_user" do
      expect(controller.current_user).to_not eq(nil)
    end

    it "should return current_user's properties" do
      expect(controller.current_user.first_name).to eq("John")
    end

    it "should route to swipes feed" do
      expect(:get => "/users/1/feed").
        to route_to(:controller => "swipes", :action => "feed", :id => "1")
    end

    it "should route to swipe_yes" do
      expect(:get => "/")
    end

  end
end
