class Service < ActiveRecord::Base
  has_many :addresses
  has_many :contacts

  has_many :types, through: :service_to_type, source: :type
  has_many :docs, through: :service_to_doc, source: :required_doc
  has_many :affiliations, through: :service_to_affiliation, source: :affiliation


  validates :name, :description, :website, presence: true

end
