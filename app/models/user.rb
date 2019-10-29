class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploader :document, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  validates :first_name, :last_name, :address, :nationality, :telephone, :whatsapp_number, presence: true
  has_many :travels
  has_many :bookings
  has_many :reviews
end
