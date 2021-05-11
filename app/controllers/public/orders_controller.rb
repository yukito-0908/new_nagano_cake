class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @address = @customer.addresses
  end
end
