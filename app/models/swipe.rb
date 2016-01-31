class Swipe < ActiveRecord::Base
  belongs_to :swiper, :class_name => "User"
  belongs_to :swipee, :class_name => "User"

  after_create :check_for_match

  def check_for_match
    # if user1 swipes yes on user2
    # AND user2 swiped yes on user1
    # then we have a match
    if self.swiped_yes
      swiper = User.find(self.swiper_id)
      swipee = User.find(self.swipee_id)

      potential_match = Swipe.where(swiper_id: swipee, swipee_id: swiper, swiped_yes: true)
      create_match(swipee.id, swiper_id) if potential_match.length >= 1
    end
  end

  def create_match(first_user_id, second_user_id)
    Match.create(first_user_id: first_user_id, second_user_id: second_user_id)
    puts "==========\nWE HAVE A MATCH\n=========="
  end

end
