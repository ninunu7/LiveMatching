class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
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
