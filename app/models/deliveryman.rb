class Deliveryman < ApplicationRecord
  # entregador
  belongs_to :address
  belongs_to :vehicle
end
