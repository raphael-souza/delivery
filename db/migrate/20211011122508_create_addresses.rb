class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :road
      t.string :number
      t.string :district
      t.string :reference_point
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
