class Type < ActiveRecord::Base
  has_many :services, through: :service_to_type

  validates :name, :description, presence: true
end
