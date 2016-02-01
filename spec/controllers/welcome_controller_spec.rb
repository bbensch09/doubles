require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  context "with no user logged in" do
    it "should render the index page" do
      get 'index'
      expect( response ).to render_template( :'welcome/index' )
    end
  end
end
