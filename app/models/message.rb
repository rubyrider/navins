# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  body            :text
#  user_id         :integer
#  conversation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :conversation, optional: true
end

# Thanks to:
# https://www.nopio.com/blog/rails-real-time-chat-application-part-1/
