class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.text :description
      t.string :status
      t.string :recipient_name
      t.boolean :paid_out
      t.float :value 

      t.references :store, null: false, foreign_key: true
      # t.references :collect, null: true, foreign_key: true

      t.timestamps
    end
  end
end
