class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /basket_items
  # GET /basket_items.json
  def index
    @basket_items = current_user.basket_items.includes(:product)
    @user = current_user
  end

  # PATCH/PUT /basket_items/1
  # PATCH/PUT /basket_items/1.json
  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.html { redirect_to basket_items_path, notice: 'Basket item was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket_item }
      else
        format.html { redirect_to basket_items_path }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/1
  # DELETE /basket_items/1.json
  def destroy
    @basket_item.destroy
    respond_to do |format|
      format.html { redirect_to basket_items_url, notice: 'Basket item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  def empty
    current_user.empty_basket
    respond_to do |format|
      format.html { redirect_to basket_items_url, notice: 'All items have been removed from the basket.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_basket_item
    @basket_item = BasketItem.where(user: current_user).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def basket_item_params
    params.require(:basket_item).permit(:quantity)
  end
end
