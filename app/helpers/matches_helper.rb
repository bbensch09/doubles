module MatchesHelper

  def get_matched_user(match, curr_user)
    # get the matched user's info
    if match.first_user_id == curr_user.id
      return match.second_user
    elsif match.second_user_id == curr_user.id
      return match.first_user
    end
  end
end
