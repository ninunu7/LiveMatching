class Customer::HomesController < ApplicationController
  def top
    @customers = current_customer.followings
    @blogs = Blog.where(customer_id: [current_customer.id, *current_customer.following_ids])
  end

  def about
  end
end
