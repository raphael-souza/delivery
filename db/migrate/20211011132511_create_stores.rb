class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.string :phone
      t.references :user

      t.timestamps
    end
  end
end
