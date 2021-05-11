class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name ,:last_name , :first_name_kana ,:last_name_kana ,:address ,:postal_code,:customer_id])
  end


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    when Customer
      public_customers_path
    end
  end
end
