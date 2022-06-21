class DeliverymanSerializer
  include FastJsonapi::ObjectSerializer
  set_type :deliveryman
  attributes :name, :cpf, :phone


  # link :self do
  #   debugger 
  #   @url_helpers.api_user_url(@object.id)
  # end
  
end
