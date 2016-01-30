class Message < ActiveRecord::Base
  belongs_to :match

  validates :message_text, presence: true
end
