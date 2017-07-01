class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id, optional: true
  belongs_to :receiver, class_name: 'User', foreign_key: :recipient_id, optional: true

  has_many :messages
end

# Thanks to:
# https://www.nopio.com/blog/rails-real-time-chat-application-part-1/