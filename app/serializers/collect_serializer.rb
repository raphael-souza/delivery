class CollectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, 
             :status, 
             :total_orders, 
             :total_value,
             :created_at,
             :updated_at
  
  belongs_to :user
  has_one :address, through: user
end
