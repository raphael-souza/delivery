class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :cnpj
      t.string :name
      t.string :phone
      t.string :email
      t.references :merchants, null: false, foreign_key: true

      t.timestamps
    end
  end
end
