class City < ApplicationRecord
  # cidade
  # pertence a um endereço e a um estado
  belongs_to :state
end
