class Customer::BlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = BlogComment.new(blog_comment_params)
    @blog_comment.customer_id = current_customer.id
    @blog_comment.blog_id = @blog.id
    @customer = @blog.customer
    if @blog_comment.save

    else
      render template: 'customer/blogs/show'
    end
  end

  def destroy
    BlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
    redirect_to blog_path(params[:blog_id])
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
