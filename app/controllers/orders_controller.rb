class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :pay, :ship]

  before_action :authenticate_user!

  before_action :require_admin, except: [:place, :user_orders, :show, :pay]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.includes(:user)
  end

  def user_orders
    @orders = current_user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # POST /orders/place
  def place
    @order = current_user.build_order
    if @order.save
      current_user.empty_basket
      redirect_to @order
    else
      redirect_to basket_items_path(current_user), notice: "There was an error creating your order."
    end
  end

  # POST /orders/1/pay
  def pay
    @order.update stripe_token: params["stripeToken"], payment_status: :paid
    flash[:success] = "Payment was successful."
    render :show
  end

  # POST /orders/1/ship
  def ship
    @order.shipped!
    render :show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

end
