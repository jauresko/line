class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  valdiates :date, :meeting_place, :drop_place, :total_price, presence: true
end
