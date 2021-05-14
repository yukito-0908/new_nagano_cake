class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
      @customer = Customer.find(params[:id])
      @customer.update(customers_params)
      redirect_to  public_customers_mypage
  end

   private
  def customers_params
    params.require(:customer).permit(:first_name ,:last_name , :first_name_kana ,:last_name_kana ,:address ,:postal_code,:customer_id, :telephone_number,:is_active)
  end

end
