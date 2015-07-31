require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "is does pass the admin check" do
    expect(user).to_not be_admin
  end

  describe "#add_to_basket" do
    subject(:user) { create(:user) }

    let(:product) { create :product }

    context "The product is not currently in the basket" do
      it "creates a new basket item" do
        expect { user.add_to_basket product }.to change { user.basket_items.count }.by(1)
      end
    end

    context "The product is in the user's basket" do
      let!(:basket_item) { create :basket_item, product: product, user: user, quantity: 1 }
      it "increases the quantity of the item in the basket by one" do
        expect { user.add_to_basket product }.to change { basket_item.reload.quantity }.by(1)
      end
    end
  end
end
