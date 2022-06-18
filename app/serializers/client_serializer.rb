class ClientSerializer
  include FastJsonapi::ObjectSerializer
  set_type :client
  attributes :name, :cpf, :phone

  has_many :address 



  # link :self do
  #   debugger 
  #   @url_helpers.api_user_url(@object.id)
  # end
  
end
