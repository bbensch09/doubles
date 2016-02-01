FactoryGirl.define do
  factory :user, :class => 'User' do
    first_name 'John'
    last_name 'Doe'
    profile_picture_url 'asdf'
    email 'JohnDoe@gmail.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
