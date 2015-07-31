class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  enum status: [:placed, :paid, :shipped]

  def user_email
    user.email
  end

  def item_count
    order_items.pluck("SUM(quantity)").first
  end

  def subtotal
    order_items.includes(:product).map(&:subtotal).sum
  end

end
