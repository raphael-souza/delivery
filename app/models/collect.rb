class Collect < ApplicationRecord
  belongs_to :client
  has_many :orders
  has_one :address, through: :client
  
end