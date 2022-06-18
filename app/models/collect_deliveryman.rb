class CollectDeliveryman < ApplicationRecord
  has_one :collect
  has_one :deliveryman

  # deve cadastrar todos os ids de entregadores que seram notificados por pedido de coleta
  enum status: [:waiting, :declined, :accepted], _default: :waiting

end
