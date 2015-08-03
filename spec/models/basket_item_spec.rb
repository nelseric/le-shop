require 'rails_helper'

RSpec.describe BasketItem, type: :model do
  it "has a valid factory" do
    expect(build :basket_item).to be_valid
  end

  describe "#subtotal" do
    let(:product) { build :product, price: 3.50 }
    subject(:order_item) { build :basket_item, quantity: 6, product: product }
    it "multiplies the product price by the order quantity" do
      expect(order_item.subtotal).to eql Money.new(2100) # 21.00 dollars in cents
    end
  end
end
