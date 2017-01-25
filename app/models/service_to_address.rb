class ServiceToAddress < ActiveRecord::Base
  belongs_to :service
  belongs_to :address
end
