class Customer::HomesController < ApplicationController
  def top
    if current_customer != nil
      @blogs = Blog.where(customer_id: [current_customer.id, *current_customer.following_ids]).order(created_at: :desc).limit(10)
    end
  end

  def about
  end


  # def guest_sign_in
  #   customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
  #     customer.password = SecureRandom.urlsafe_base64
  #   end
  #   sign_in customer
  #   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  # end

end
