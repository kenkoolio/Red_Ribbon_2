class Service < ActiveRecord::Base
  has_many :service_to_addresses
  has_many :addresses, through: :service_to_addresses
  has_many :contacts

  has_many :service_to_types
  has_many :types, through: :service_to_types

  has_many :service_to_docs
  has_many :required_docs, through: :service_to_docs

  has_many :service_to_affiliations
  has_many :affiliations, through: :service_to_affiliations


  validates :name, :description, :website, presence: true

end
