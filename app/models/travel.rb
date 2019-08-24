class Travel < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :first_name, :last_name, :photo, :address, :nationality, :telephone, :whatsapp_number, presences: true
end
