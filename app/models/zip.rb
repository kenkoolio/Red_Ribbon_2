class Zip < ActiveRecord::Base
  has_many :addresses

  validates :code, presence: true
end
