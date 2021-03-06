class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
	  @customer = Customer.find(params[:id])
		@customer.update(customer_params)
		redirect_to admin_customer_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :birth_date, :gender, :introduction, :user_status)
  end
end