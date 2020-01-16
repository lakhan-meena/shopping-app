class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :timeoutable
  validates :first_name, :last_name, :mobile_number, :username, presence: true
  validates :mobile_number, :username, uniqueness: true
  before_save { self.email.downcase! }

  def admin?
    has_role?(:admin)
  end
end
