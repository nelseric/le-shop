class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def subtotal
    product.price * quantity
  end

  delegate :name, to: :product, prefix: true

  delegate :price, to: :product, prefix: true
end
