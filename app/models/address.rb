class Address < ApplicationRecord
  # Endereço:
  # toda loja/entregador/pedido precia de um 
  # cidade, estado, rua, cep, numero, complemento, referencia
  belongs_to :city
end
