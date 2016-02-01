FactoryGirl.define do
  factory :first_login_user, :class => 'User' do
    first_name 'Michelle'
    last_name 'Doe'
    age 30
    gender "female"
    location "NYC"
    latitude 37.7841
    longitude -122.3957
    bio "Young professional looking for some competition"
    profile_picture_url 'asdf'
    email Faker::Internet.email
    password 'password'
    password_confirmation 'password'
    sign_in_count 1
  end

  factory :user, :class => 'User' do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    latitude 37.7841
    longitude -122.3957
    bio Faker::Hipster.sentence
    profile_picture_url Faker::Placeholdit.image
    email Faker::Internet.email
    password 'password'
    password_confirmation 'password'
    confirmed_at = Time.now
    sign_in_count 2
  end
end
