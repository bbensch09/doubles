class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]


  after_create :update_access_token!

  validates :email, presence: true, uniqueness: true

  has_many :swipes, :foreign_key => "swiper_id", :class_name => "Swipe"
  has_many :swipees, through: :swipes, :foreign_key => "swipee_id", :class_name => "User"
  has_many :second_user_matches, :foreign_key => "second_user_id", :class_name => "Match"
  has_many :first_user_matches, :foreign_key => "first_user_id", :class_name => "Match"

  has_many :activity_blurbs
  has_many :activities, through: :activity_blurbs
  after_save :matches

  def matches
    self.first_user_matches + self.second_user_matches
  end

  def potential_matches
    # shoudl return a list of users based on same matches and where there isn't already a swipe id
    # unseen_potential_matches = geo_activity_matches - current_user.swipees
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    end
  end


  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
  end
end
