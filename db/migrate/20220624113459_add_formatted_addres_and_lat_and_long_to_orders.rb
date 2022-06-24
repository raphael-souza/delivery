class AddFormattedAddresAndLatAndLongToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :formated_addres, :string
    add_column :orders, :lat, :float
    add_column :orders, :long, :float
  end
end
