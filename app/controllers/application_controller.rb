class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_customers_path
    when Customer
      root_path
    end
  end

  def authenticate_customer
    if session[:customer_id] == nil #ログインしていない場合
      # flash[:notice] = "ログインが必要です"
      redirect_to new_customer_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :profile_image, :birth_date, :gender])
    devise_parameter_sanitizer.permit(:account_update,keys:[:name, :profile_image, :birth_date, :gender, :introduction])
  end
end
