class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.string :phone
      t.string :role
      t.references :address, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
