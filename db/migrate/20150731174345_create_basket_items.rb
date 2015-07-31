class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
