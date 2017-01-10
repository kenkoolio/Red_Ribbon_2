class Contact < ActiveRecord::Base
  belongs_to :service

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :phone, presence: true, length: { is: 10 }

  #todo - before save/create, make phone a string of only numbers (remove special characters)
  before_create do
    :phone = :phone.to_s
  end
end
