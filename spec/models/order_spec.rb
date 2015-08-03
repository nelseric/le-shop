require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    expect(build :order).to be_valid
    expect(build :order_with_items).to be_valid
  end

  subject(:order) do
    create(:order_with_items,
           order_items: create_list(:order_item, 3,
                                    product: create(:product, price: 25.00)
                                   )
          )
  end

  describe "#item_count" do
    it "sums the quantity of each order item" do
      # order factory gets 3 items, with 1 qty each
      expect(order.item_count).to eql 3
    end
  end

  describe "#subtotal" do
    it "sums the subtotal for all order items" do
      expect(order.subtotal).to eql 75.00
    end
  end

  describe "#can_ship?" do
    context "The order has not shipped" do
      before do
        order.not_shipped!
      end

      context "The order has been paid" do
        before do
          order.paid!
        end

        it "can now be shipped." do
          expect(order.can_ship?).to be true
        end
      end

      context "The order has not been paid" do
        before do
          order.unpaid!
        end

        it "can't be shipped until the customer has paid for their order" do
          expect(order.can_ship?).to be false
        end
      end
    end

    context "The order has already shipped" do
      before do
        order.shipped!
      end

      it "can not be shipped a second time" do
        expect(order.can_ship?).to be false
      end
    end
  end
end
