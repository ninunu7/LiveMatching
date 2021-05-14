class Customer::BlogsController < ApplicationController
  def new
  end

  def index
    @blog = Blog.new
    @blogs = Blog.all
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    redirect_to blogs_path, notice: "投稿しました"
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_text, blog_images_images: [])
  end
end
