class User < ActiveRecord::Base
  belongs_to :address
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false, message: "That e-mail is already in use!" }, format: { with: EMAIL_REGEX }
  validates :alias, presence: true, uniqueness: { case_sensitive: false, message: "That username is already in use!" }, length: { minimum: 3 }
  validates :address, presence: true

  before_create do
    self.id == 1 ? self.user_level = 9 : self.user_level = 0
  end
end
