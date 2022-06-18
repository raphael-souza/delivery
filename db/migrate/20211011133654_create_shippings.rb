class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      t.string :identifier
      t.string :status
      t.references :deliverymen, null: false, foreign_key: true
      # t.references :businesses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
