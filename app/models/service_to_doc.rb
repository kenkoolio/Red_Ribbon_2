class ServiceToDoc < ActiveRecord::Base
  belongs_to :service
  belongs_to :required_doc
end
