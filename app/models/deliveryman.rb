class Deliveryman < ApplicationRecord
  has_many :address
  has_many :collects

  accepts_nested_attributes_for :address, :allow_destroy => true

end
