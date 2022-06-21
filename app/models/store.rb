class Store < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :collects

  accepts_nested_attributes_for :orders, :allow_destroy => true
  accepts_nested_attributes_for :collects, :allow_destroy => true
end
