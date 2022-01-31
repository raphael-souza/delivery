class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :description
      t.string :recipient_name
      t.boolean :paid_aout
      t.decimal :value
      t.references :address, null: false, foreign_key: true
      t.references :collect, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
