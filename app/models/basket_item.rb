class BasketItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def product_name
    product.name
  end

  def product_price
    product.price
  end

  def subtotal
    product.price * quantity
  end
end
