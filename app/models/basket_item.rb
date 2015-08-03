class BasketItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  delegate :name, to: :product, prefix: true
  delegate :price, to: :product, prefix: true

  validates :user, :product, presence: true

  def subtotal
    product.price * quantity
  end
end
