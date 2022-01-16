class Deliveryman < ApplicationRecord
  belongs_to :user
  has_many :address

  accepts_nested_attributes_for :address, :allow_destroy => true

end
