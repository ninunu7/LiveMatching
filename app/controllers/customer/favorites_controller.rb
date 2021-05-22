class Customer::FavoritesController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    favorite = current_customer.favorites.new(blog_id: @blog.id)
    favorite.save
    #redirect_to blog_path(blog)
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    favorite = current_customer.favorites.find_by(blog_id: @blog.id)
    favorite.destroy
    #redirect_to blog_path(blog)
  end
end
