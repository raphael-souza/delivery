class Merchant < ApplicationRecord
  # Lojista
  # Cliente principal. Foco do produto
  #  deve solicitar pedido para sua loja
  belongs_to :address
  belongs_to :user
end
