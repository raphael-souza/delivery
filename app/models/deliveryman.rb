class Deliveryman < ApplicationRecord
  belongs_to :address
  belongs_to :vehicle
end
