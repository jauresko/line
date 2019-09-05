class Purchase < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_one :order, dependent: :destroy
end
