class Customer::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

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
