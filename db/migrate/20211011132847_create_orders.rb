class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.numeric :key
      t.text :description
      t.string :status
      t.references :stores, null: false, foreign_key: true

      t.timestamps
    end
  end
end
