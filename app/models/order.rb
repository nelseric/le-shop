class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :user, :presence => true

  enum payment_status: [:unpaid, :paid]
  enum shipping_status: [:not_shipped, :shipped]

  delegate :email, to: :user, prefix: true

  def item_count
    order_items.sum(:quantity)
  end

  def subtotal
    Money.new order_items.includes(:product).map(&:subtotal).sum
  end

  def can_ship?
    paid? && not_shipped?
  end
end
