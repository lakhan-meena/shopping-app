class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :timeoutable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  validates :first_name, :last_name, :mobile_number, :username, presence: true
  validates :mobile_number, :username, uniqueness: true
  auto_strip_attributes :first_name, :last_name, :mobile_number, :username, :email, squish: true
  before_save { self.email.downcase! }
  after_create :asign_role
  mount_uploader :profile_picture, ImageUploader
  has_many :orders

  def admin?
    has_role?(:admin)
  end

  def asign_role
    self.add_role :default
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      begin
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.username = auth.info.name
        user.profile_picture = auth.info.image
        user.save(validate: false)
      rescue
        return nil
      end
    end
  end
end
