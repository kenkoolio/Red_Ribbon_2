class RequiredDoc < ActiveRecord::Base
  has_one :service, through: :service_to_doc

  validates :name, :description, :document, presence: true
end
