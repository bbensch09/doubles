class Swipe < ActiveRecord::Base
  belongs_to :swiper, :class_name => "User"
  belongs_to :swipee, :class_name => "User"

  after_create :check_for_matches

  def check_for_matches
    # if user1 swipes yes on user2
    # AND user2 swiped yes on user1
    # then we have a match
    if self.swiped_yes
      swiper = self.swiper
      swipee = self.swipee

      potential_match = Swipe.where(swiper_id: swipee, swipee_id: swiper, swiped_yes: true)
      Match.create(first_user_id: swipee.id, second_user_id: swiper.id) if potential_match.length >= 1
      puts "==========\nWE HAVE A MATCH\n==========" if potential_match.length >= 1
    end
  end
end
