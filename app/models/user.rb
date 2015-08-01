class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :basket_items
  has_many :orders

  def admin?
    false
  end

  def add_to_basket(product)
    if item = basket_items.find_by(product: product)
      item.increment! :quantity
    else
      basket_items << BasketItem.new(product: product, quantity: 1)
    end
  end

  def empty_basket
    basket_items.destroy_all
  end

  def basket_count
    basket_items.pluck("SUM(quantity)").first || 0
  end

  def basket_total
    basket_items.includes(:product).map(&:subtotal).sum
  end

  def build_order
    order = Order.new(user: self)
    order.order_items = basket_items.includes(:product).map{|item| OrderItem.new product: item.product, quantity: item.quantity  }
    order
  end
end
