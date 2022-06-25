class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description,
             :recipient_name,
             :paid_out,
             :value,
             :created_at
  
  belongs_to :store
  has_one :collect
end
