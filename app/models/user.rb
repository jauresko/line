class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploader :document, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  # validates :first_name, :last_name, :address, :nationality, :telephone, :whatsapp_number, presence: true
  has_many :travels
  has_many :bookings
  has_many :reviews

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name # assuming the user model has a name
      user.image = auth.info.image
      user.birthday = auth.info.birthday
      user.address = auth.info.address
      user.save# assuming the user model has an image
    end
  end
end
