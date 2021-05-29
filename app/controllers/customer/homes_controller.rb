class Customer::HomesController < ApplicationController
  def top
    if current_customer != nil
      @blogs = Blog.where(customer_id: [current_customer.id, *current_customer.following_ids]).order(created_at: :desc).limit(10)
    end
  end

  def about
  end

end
