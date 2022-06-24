class Order < ApplicationRecord
  # *Atributos* 
  # "description",
  # "status",
  # "recipient_name",
  # "paid_out",
  # "value",
  # "store_id",
  # "collect_id",
  # "formated_addres", -> endereço completo
  # "lat", latitude -> latitude
  # "long" -> longitude

  belongs_to :collect, optional: true 
  belongs_to :store

end
