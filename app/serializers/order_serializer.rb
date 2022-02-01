class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description,
             :recipient_name,
             :paid_aout,
             :value
  
  belongs_to :user
  has_one :address
  has_one :collect
end
