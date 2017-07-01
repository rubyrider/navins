# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  age                    :integer
#  gender                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :conversations, foreign_key: :sender_id, inverse_of: :sender
  has_many :received_conversations, class_name: 'Conversation', foreign_key: :recipient_id, inverse_of: :receiver

  GENDER_DICTIONARY = [
    ['Male', :male],
    ['Female', :female],
    ['Third Gender', :third_gender]
  ]

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
