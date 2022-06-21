class Collect < ApplicationRecord
  belongs_to :store
  has_many :orders, optional: true 
  
end