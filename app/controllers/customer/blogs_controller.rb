class Customer::BlogsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @blog_new = Blog.new
  end

  def index
    @blogs = Blog.where(customer_id: params[:customer_id]).order(created_at: :desc)
    @blogs = Kaminari.paginate_array(@blogs).page(params[:page]).per(10)
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @blogs = Blog.where(customer_id: params[:customer_id])
    @blogs = Kaminari.paginate_array(@blogs).page(params[:page]).per(10)
    @blog_new = Blog.new(blog_params)
    @blog_new.customer_id = current_customer.id
    if blog_params["blog_images_images"].count > 9
      flash[:notice] = "画像は8枚まで投稿できます"
      render :new
      return
    end
    if @blog_new.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to blogs_path(customer_id: current_customer.id)
    else
      render :new
    end
  end

  def detail
    @blogs = Blog.where(id: BlogComment.where(customer_id: current_customer.id).pluck(:blog_id))
  end

  def show
    @blogs = Blog.where(customer_id: params[:customer_id])
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
