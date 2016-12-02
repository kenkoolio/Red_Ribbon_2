class Address < ActiveRecord::Base
  belongs_to :state
  belongs_to :zip

  has_many :users
  has_many :services

  validates :number, :street, :city, :state, :zip, presence: true
end
