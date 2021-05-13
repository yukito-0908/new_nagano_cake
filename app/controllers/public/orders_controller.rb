class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @address = @customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @tax = 1.10
    if  params[:order][:address_option] == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delibery_address = current_customer.address
      @order.delivery_name = current_customer.full_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postal_code = @address.postal_code
      @order.delibery_address = @address.address
      @order.delivery_name = @address.name
    end
  end


  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @tax = 1.10
  end

  def show_done
  end


  def index
    @orders = current_customer.orders
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
      if @cart_items.each do |cart_item|
         @order_item = OrderItem.new(
            order_id: @order.id,
            item_id: cart_item.item.id,
            quantity: cart_item.amount,
            buy_price: cart_item.item.price
          )
          @order_item.save
        end
        @cart_items.destroy_all
        redirect_to public_orders_complete_path
      else
        render :confirm
      end
  end


  private
  def order_params
    params.require(:order).permit(:method_of_payment,:delivery_postal_code,:delibery_address,:delivery_name, :shopping, :billing_amount,:updated_at)
  end
end
