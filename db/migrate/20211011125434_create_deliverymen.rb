class CreateDeliverymen < ActiveRecord::Migration[6.1]
  def change
    create_table :deliverymen do |t|
      t.string :name
      t.string :cpf
      t.references :address, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
