# spec/features/external_request_spec.rb
require 'spec_helper'

feature 'External request' do
  it 'queries FactoryGirl contributors on GitHub' do
    uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
