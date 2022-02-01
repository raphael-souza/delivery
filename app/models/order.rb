class Order < ApplicationRecord

  belongs_to :address
  belongs_to :collect, optional: true 
  belongs_to :client

  accepts_nested_attributes_for :address, :allow_destroy => true

end