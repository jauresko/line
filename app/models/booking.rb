class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  has_many :user, through: :travels
  validates :date, :meeting_place, :drop_place, :total_price, presence: true
end
