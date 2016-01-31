class Match < ActiveRecord::Base
  belongs_to :first_user, :class_name => "User"
  belongs_to :second_user, :class_name => "User"

  validates_uniqueness_of :first_user_id, :scope => :second_user_id

end
