class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]


  # add geokit within radius method used in User#users_within_radius
  acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude

  after_create :update_access_token!

  validates :email, presence: true, uniqueness: true
  validates_format_of :zipcode, :with => /\A\d{5}\z/, :message => "should be in the form 12345", :allow_blank => true

  has_many :swipes, :foreign_key => "swiper_id", :class_name => "Swipe"
  has_many :swipees, through: :swipes, :foreign_key => "swipee_id", :class_name => "User"
  has_many :second_user_matches, :foreign_key => "second_user_id", :class_name => "Match"
  has_many :first_user_matches, :foreign_key => "first_user_id", :class_name => "Match"

  has_many :activity_blurbs
  has_many :activities, through: :activity_blurbs

# HACKY_SHIT method for development purposes
def everyone_swipes_you
  everyone_else = User.all
  everyone_else.each do |user|
    user.swipes.create(swipee_id: self.id, swiped_yes: [true,false].sample)
  end
  return "everyone swiped you!"
end

# HACKY_SHIT cuz nil is tired of manually doing things
def reset_swipes
  self.swipes.each {|swipe| swipe.destroy}
  p "swipes deleted"
  self.everyone_swipes_you
  p "errbody swiped you"
end

def lat_lng_by_zipcode
  api_response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.zipcode}&key=#{ENV['GOOGLE_API']}")
  response = api_response.parsed_response

  if response["status"] == "OK"
    lat = response["results"][0]["geometry"]["location"]["lat"]
    lng = response["results"][0]["geometry"]["location"]["lng"]
    return true if self.update_attributes(:latitude => lat, :longitude => lng)
  else
    false
  end
end

def matches
  self.first_user_matches + self.second_user_matches
end


def narrow_users
  users_nearby = self.users_within_radius
  unswiped_users_nearby = unswiped_users(users_nearby)
  shared_activity_unswiped_users_nearby = users_with_shared_activities(unswiped_users_nearby)
  shared_activity_unswiped_users_nearby
end

def users_within_radius
  geo_location = [self.latitude, self.longitude]
  other_users = User.where.not(id: self.id)
  close_users = other_users.within(20, :origin => geo_location)
end

def unswiped_users(user_objects)
  user_objects.select{|user|self.swipees.exclude?(user)}
end

def users_with_shared_activities(user_objects)
  my_activity_ids = self.activities.pluck(:id)
  user_objects = user_objects.select do |user_object|
    other_user_activity_ids = user_object.activities.pluck(:id)
    (other_user_activity_ids & my_activity_ids).any?
  end
  user_objects
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end
end

def unread_messages_in_match(match)
  return Message.where(match_id: match.id, recipient_id: self.id, unread: true).count
end

def user_unread_messages
  return Message.where(recipient_id: self.id, unread: true).count
end

private

def update_access_token!
  self.access_token = "#{self.id}:#{Devise.friendly_token}"
end

end
