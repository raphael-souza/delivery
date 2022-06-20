class Store < ApplicationRecord
  belongs_to :user

  has_many :orders
  has_many :collects
end
