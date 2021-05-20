class Customer::BlogsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @blog_new = Blog.new
    @blogs = Blog.where(customer_id: params[:customer_id])
  end

  def create
    @blogs = Blog.where(customer_id: params[:customer_id])
    @blog_new = Blog.new(blog_params)
    @blog_new.customer_id = current_customer.id
    if @blog_new.save
      redirect_to blogs_path(customer_id: current_customer.id)
    else
      render :index
    end
  end

  def show
    @blog_new = Blog.new
    @blog = Blog.find(params[:id])
    @customer = @blog.customer
    @blog_comment = BlogComment.new
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path(customer_id: current_customer.id)
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_text, blog_images_images: [])
  end
end
