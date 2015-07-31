class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :pay, :ship]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.includes(:user)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def place
    @order = current_user.build_order
    if @order.save
      render :show
    else
      redirect_to basket_items_path(current_user), notice: "There was an error creating your order."
    end
  end

  def pay
    @order.paid!
    render :show
  end

  def ship
    @order.shipped!
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :stripe_token, :status)
    end
end
