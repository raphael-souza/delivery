class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  attributes :email
  
  has_one :store

  # link :self do
  #   debugger 
  #   @url_helpers.api_user_url(@object.id)
  # end
  
end
