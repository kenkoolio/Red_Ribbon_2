class Affiliation < ActiveRecord::Base
  has_many :services, through: :service_to_affiliation

  validates :name, :description, presence: true
end
