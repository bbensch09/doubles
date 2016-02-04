class ActivityBlurb < ActiveRecord::Base
  before_create do
    self.activity_id
    activity = Activity.find(self.activity_id)
    self.sport = activity.name
  end

  belongs_to :activity
  belongs_to :user

  validates :activity_id, :uniqueness => { :scope => :user_id }
  # validates :text, presence: true
end
