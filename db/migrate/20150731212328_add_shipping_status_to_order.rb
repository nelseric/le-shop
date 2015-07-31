class AddShippingStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_status, :integer, default: 0
    rename_column :orders, :status, :payment_status
  end
end
