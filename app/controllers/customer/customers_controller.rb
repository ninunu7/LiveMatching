class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
    @blogs = Blog.where(customer_id: params[:customer_id])
  end

  # def detail
  #   @events = Event.where(id: Comment.where(customer_id: current_customer.id).pluck(:event_id))
  # end

  def edit
    @customer = current_customer
    if @customer.save
      redirect_to edit_customer_path(@customer.id)
    else
      render :edit
    end
  end

  def quit
  end

  def out
    @customer = current_customer
    @customer.update(user_status: false)
    sign_out current_customer
    #reset_session または　sign_out current_customer でログアウト
    #アカウント削除のpathと被るためコントローラー内でログアウト指示
    redirect_to root_path
  end
end
