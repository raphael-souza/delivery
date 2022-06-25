class Deliveryman < ApplicationRecord
  has_one :user_id, optional: true
end
