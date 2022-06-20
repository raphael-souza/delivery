class Order < ApplicationRecord

  belongs_to :collect, optional: true 
  belongs_to :store

end
