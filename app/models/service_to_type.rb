class ServiceToType < ActiveRecord::Base
  belongs_to :service
  belongs_to :type
end
