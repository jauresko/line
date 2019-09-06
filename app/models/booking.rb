class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  belongs_to :review
end
