class CollectDeliverymen < ActiveRecord::Migration[6.1]
  def change
    create_table :collect_deliverymen do |t|
      t.string :status
      t.references :collect, null: true, foreign_key: true
      t.references :deliveryman, null: true, foreign_key: true
      t.timestamps
    end
  end
end
