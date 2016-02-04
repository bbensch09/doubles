class ActivityBlurb < ActiveRecord::Base
  before_create do
    p self.activity_id
    activity = Activity.find(self.activity_id)
    self.sport = activity.name
  end

  belongs_to :activity
  belongs_to :user

  # validates :text, presence: true
end
