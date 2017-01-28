class Address < ActiveRecord::Base
  belongs_to :state
  belongs_to :zip

  has_many :users
  has_many :service_to_addresses
  has_many :services, through: :service_to_addresses

  validates :number, :street, :city, presence: true

end
