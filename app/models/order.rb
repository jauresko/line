class Order < ApplicationRecord
  belongs_to :user
  belongs_to :purchase
  has_one :chat_room
end
