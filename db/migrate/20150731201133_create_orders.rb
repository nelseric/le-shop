class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :stripe_token
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
