class StoreSerializer
  include FastJsonapi::ObjectSerializer
  set_type :store
  attributes :id, :name, :cpf, :cnpj, :phone, :created_at
  
  # belongs_to :user

  # link :self do
  #   debugger 
  #   @url_helpers.api_user_url(@object.id)
  # end
  
end
