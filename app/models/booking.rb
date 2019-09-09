class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  has_one :chat_room
end
