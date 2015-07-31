class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :basket_items

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

  def clear_basket
    basket_items.destroy_all
  end
end
