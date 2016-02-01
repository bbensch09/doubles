require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  it "should let a user see all the posts" do
    login_with create( :user )
    get '/'
    expect( response ).to render_template( :'welcome/index' )
  end
end
