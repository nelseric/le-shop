class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order, :product, :quantity, presence: true

  delegate :name, to: :product, prefix: true
  delegate :price, to: :product, prefix: true

  def subtotal
    product_price * quantity
  end
end
