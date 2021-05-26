class Customer::CommentsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @event = Event.find(params[:event_id])
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
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
