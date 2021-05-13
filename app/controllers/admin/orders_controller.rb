class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
  end


   private
  def orders_params
    params.require(:order).permit(:is_active)
  end

end
