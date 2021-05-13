class Public::CustomersController < ApplicationController
  def mypage
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customers_params)
    redirect_to  public_customers_mypage_path
  end

  def unsustainable
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
     @customer.update(is_active: false)
        #ログアウトさせる
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
  end

  private
  def customers_params
    params.require(:customer).permit(:first_name ,:last_name , :first_name_kana ,:last_name_kana ,:address ,:postal_code,:customer_id, :telephone_number,:is_active)
  end
end
