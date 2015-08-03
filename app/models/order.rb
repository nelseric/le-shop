class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum payment_status: [:unpaid, :paid]
  enum shipping_status: [:not_shipped, :shipped]

  delegate :email, to: :user, prefix: true

  def item_count
    order_items.sum(:quantity)
  end

  def subtotal
    order_items.includes(:product).map(&:subtotal).sum
  end

  def can_ship?
    paid? && not_shipped?
  end
end
