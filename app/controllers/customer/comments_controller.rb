class Customer::CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    #comment = Comment.create(comment_params)
    @comment = current_customer.comments.new(comment_params)
    @comment.event_id = @event.id
    if @comment.save
    else
      render 'customer/events/show'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = Comment.find_by(id: params[:id], event_id: params[:event_id]).destroy
    #redirect_to event_path(params[:event_id])
  end
    #@blog_comment = BlogComment.find_by(id: params[:id], blog_id: params[:blog_id])


  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
