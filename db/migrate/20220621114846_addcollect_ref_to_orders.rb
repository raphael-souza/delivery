class AddcollectRefToOrders < ActiveRecord::Migration[6.1]
  def change
      add_reference :orders, :collect, null: true, foreign_key: true

  end
end
