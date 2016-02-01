class Swipe < ActiveRecord::Base
  belongs_to :swiper, :class_name => "User"
  belongs_to :swipee, :class_name => "User"

  validate :check_swipe_yourself
  after_create :check_for_match

  def check_for_match
    # if user1 swipes yes on user2
    # AND user2 swiped yes on user1
    # then we have a match
    if self.swiped_yes
      swiper = User.find(self.swiper_id)
      swipee = User.find(self.swipee_id)

      potential_match = swipee.swipes.where(swipee_id: swiper.id, swiped_yes: true)
      create_match(swipee.id, swiper_id) if ( potential_match.length > 0 )
    end
  end

  def check_swipe_yourself
    errors.add(:swiper_id, "you can't swipe yourself") if swiper_id == swipee_id
  end

  def create_match(first_user_id, second_user_id)
    Match.create(first_user_id: first_user_id, second_user_id: second_user_id)
    puts "==========\nWE HAVE A MATCH\n=========="
  end

end
