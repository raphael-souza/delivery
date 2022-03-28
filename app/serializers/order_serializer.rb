class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description,
             :recipient_name,
             :paid_aout,
             :value,
             :created_at
  
  belongs_to :client
  has_one :address
  has_one :collect
end
