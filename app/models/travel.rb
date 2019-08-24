class Travel < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :first_name, :last_name, :address, :nationality, :telephone, :whatsapp_number, presence: true
end
