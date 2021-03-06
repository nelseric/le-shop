require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OrdersController, type: :controller do
  let(:user) { create :admin }
  before(:each) do
    sign_in user
  end

  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    build_attributes(:order)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      order = Order.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #user_orders" do
    let!(:user_orders) { create_list(:order, 2, user: user) }
    let!(:some_other_orders) { create_list(:order, 2) }

    it "assigns only the current user's orders" do
      get :user_orders, {}, valid_session
      expect(assigns(:orders)).to eq user_orders
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, { :id => order.to_param }, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST #place" do
    context "The user has items in their basket" do
      before do
        create_list :basket_item, 3, user: user
      end

      it "creates a new order" do
        expect do
          post :place, {}, valid_session
        end.to change(Order, :count).by 1
      end

      it "clears the user's basket" do
        post :place, {}, valid_session
        expect(user.basket_items.count).to be 0
      end
    end

    context "The user has no items in their basket" do
      it "redirects to the users basket" do
        post :place, {}, valid_session
        expect(response).to redirect_to basket_items_path
      end
    end
  end

  describe "POST #pay" do
    it "marks the order as paid" do
      order = create :order
      post :pay, id: order.to_param, stripeToken: "foo_bar"
      order.reload
      expect(order).to be_paid
    end

    it "saves the stripe token" do
      order = create :order
      post :pay, id: order.to_param, stripeToken: "foo_bar"
      order.reload
      expect(order.stripe_token).to eq "foo_bar"
    end
  end

  describe "POST #ship" do
    it "marks the order as shipped" do
      order = create :order
      post :ship, { id: order.to_param }, valid_session
      order.reload
      expect(order).to be_shipped
    end
  end
end
