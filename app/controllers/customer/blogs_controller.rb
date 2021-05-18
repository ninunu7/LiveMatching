class Customer::BlogsController < ApplicationController
  before_action :authenticate_customer!
  def new
  end

  def index
    @blog_new = Blog.new
    @blogs = Blog.where(customer_id: params[:customer_id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.customer_id = current_customer.id
    @blog.save
    redirect_to blogs_path, notice: "投稿しました"
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
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_text, blog_images_images:[])
  end
end
