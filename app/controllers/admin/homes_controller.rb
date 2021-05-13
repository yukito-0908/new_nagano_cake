class Admin::HomesController < ApplicationController

  def top
    if params[:customer_id] == "" || params[:customer_id] == nil
      @orders = Order.all
    else
      @orders = Customer.find(params[:customer_id]).orders
    end
  end

end
