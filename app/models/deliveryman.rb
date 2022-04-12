class Deliveryman < ApplicationRecord
  has_many :address

  accepts_nested_attributes_for :address, :allow_destroy => true

end
