class AddressSerializer
  include FastJsonapi::ObjectSerializer

  set_type :address
  attributes :description, :number, :reference, :street :city, :cep, :district

end