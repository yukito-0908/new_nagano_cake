class Admin::OrdersController < ApplicationController

  def show
     params[:order_id]
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(orders_params)
    @order_item = @order.order_items
    if @order.is_active == '入金確認'
    @order_item.update(
      is_active: "制作待ち",
    )
    redirect_to admin_root_path(customer_id: @order.customer.id)
    end
  end


   private
  def orders_params
    params.require(:order).permit(:is_active,:customer_id)
  end

end
