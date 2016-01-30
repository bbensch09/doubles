class ActivityBlurb < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  validates :text, presence: true
end
