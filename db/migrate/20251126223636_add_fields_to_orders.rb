class AddFieldsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :subtotal, :decimal
    add_column :orders, :shipping_address, :text
  end
end
