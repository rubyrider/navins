class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :conversations, foreign_key: :sender_id, inverse_of: :sender
  has_many :received_conversations, class_name: 'Conversation', foreign_key: :recipient_id, inverse_of: :receiver
end
