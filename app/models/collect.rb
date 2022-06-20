class Collect < ApplicationRecord
  belongs_to :client
  has_many :orders, optional: true 
  
end