class CreateDeliverymen < ActiveRecord::Migration[6.1]
  def change
    create_table :deliverymen do |t|
      t.string :name
      t.string :cpf
      t.string :phone
      t.string :client_id

      t.timestamps
    end
  end
end
