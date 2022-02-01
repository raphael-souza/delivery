class Collect < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one :address, through: user


end