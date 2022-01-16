class AddReferencesClientAnddeliverymanToAddress < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :client, foreign_key: true
    add_reference :addresses, :deliveryman, foreign_key: true
  end
end
