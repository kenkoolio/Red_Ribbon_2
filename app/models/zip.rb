class Zip < ActiveRecord::Base
  has_many :addresses

  validates :code, presence: true, length: { is: 5 }

end
