class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(orders_params)
    redirect_to admin_root_path(customer_id: @order.customer.id)
  end


   private
  def orders_params
    params.require(:order).permit(:is_active,:customer_id)
  end

end
