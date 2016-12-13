class Service < ActiveRecord::Base
  has_many :addresses
  has_many :contacts

  has_many :types, through: :service_to_type
  has_many :required_docs, through: :service_to_doc
  has_many :affiliations, through: :service_to_affiliation


  validates :name, :description, :website, presence: true

end
