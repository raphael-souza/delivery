class CreateCollect < ActiveRecord::Migration[6.1]
  def change
    create_table :collects do |t|
      t.string :description
      t.string :status

      t.references :store, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true

      t.timestamps
    end
  end
end
