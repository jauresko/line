class Purchase < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :orders, dependent: :destroy
end
