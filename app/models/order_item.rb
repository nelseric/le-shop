class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def subtotal
    product.price * quantity
  end

  def product_name
    product.name
  end

  def product_price
    product.price
  end
end
