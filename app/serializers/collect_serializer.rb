class CollectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, 
             :status,
             :created_at,
             :updated_at
  
  belongs_to :store
  has_many :orders
end
