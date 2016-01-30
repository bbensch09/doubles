class Activity < ActiveRecord::Base
  has_many :activity_blurbs
  has_many :users, through: :activity_blurbs

  validates :name, presence: true
end
