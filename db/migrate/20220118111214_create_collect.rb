class CreateCollect < ActiveRecord::Migration[6.1]
  def change
    create_table :collects do |t|
      t.string :description
      t.string :status
      t.decimal :total_orders
      t.float :total_value
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
