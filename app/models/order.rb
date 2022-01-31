class Order < ApplicationRecord

  has_one :address
  has_one :collect
  belongs_to :user

end