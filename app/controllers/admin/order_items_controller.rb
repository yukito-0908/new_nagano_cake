class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_items_params)
    if @order_item.is_active == "製作中"
    @order.update(
      is_active: "製作中"
    )
    elsif @order_item.is_active == "製作完了"
      @order.update(
        is_active: "発送準備中"
      )
    redirect_to admin_root_path(customer_id: @order_item.order.customer.id)
    else
    redirect_to admin_root_path
    end
  end

  private
  def order_items_params
    params.require(:order_item).permit(:is_active,:customer_id)
  end
end
