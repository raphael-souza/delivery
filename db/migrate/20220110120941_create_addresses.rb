class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :number
      t.string :reference
      t.string :street

      t.timestamps
    end
  end
end
