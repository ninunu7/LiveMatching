class Customer::BlogCommentsController < ApplicationController
  def create
    blog = Blog.find(params[:blog_id])
    #@blog_comment.customer_id = current_user.id
    blog_comment = BlogComment.create(blog_comment_params)
    @blog_comment = current_customer.blog_comments.new(blog_comment_params)
    @blog_comment.blog_id = blog.id
    @blog_comment.save
    redirect_to blog_path(blog)
  end

  def destroy
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
