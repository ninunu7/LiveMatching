class Customer::RelationshipsController < ApplicationController

  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.follow(params[:customer_id])
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollow(params[:customer_id])
  end

  def followings
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings
  end

  def followers
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :birth_date, :gender, :profile_image, :introduction])
  end
end
