class Client < ApplicationRecord
  belongs_to :user
  has_many :address
  has_many :orders

  accepts_nested_attributes_for :address, :allow_destroy => true

end
