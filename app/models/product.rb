class Product < ActiveRecord::Base
  validates :name, presence: true

  monetize :price_cents

  has_many :basket_items
end
