class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order, :product, :quantity, presence: true
  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }

  delegate :name, to: :product, prefix: true
  delegate :price, to: :product, prefix: true

  def subtotal
    product_price * quantity
  end
end
