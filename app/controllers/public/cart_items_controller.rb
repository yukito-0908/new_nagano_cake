class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @tax = 1.10
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    check = false
    @cart_items.each do |cart_item|
      if  @cart_item.item.id == cart_item.item.id
        cart_item.amount += @cart_item.amount
        cart_item.save
        check = true
        break
      end
    end
    if check #元々カートに商品があれば
    redirect_to public_cart_items_path
    else #なかった場合
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id)
  end

end
