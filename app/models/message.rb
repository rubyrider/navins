class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :conversation, optional: true
end

# Thanks to:
# https://www.nopio.com/blog/rails-real-time-chat-application-part-1/