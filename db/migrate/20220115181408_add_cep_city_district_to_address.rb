class AddCepCityDistrictToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :city, :string
    add_column :addresses, :cep, :string, :limit => 9
    add_column :addresses, :district, :string
  end
end
