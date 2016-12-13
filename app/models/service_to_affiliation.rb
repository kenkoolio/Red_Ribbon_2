class ServiceToAffiliation < ActiveRecord::Base
  belongs_to :service
  belongs_to :affiliation
end
