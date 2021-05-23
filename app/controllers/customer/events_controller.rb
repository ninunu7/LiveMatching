class Customer::EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id
    if @event.save
      redirect_to events_path(customer_id: current_customer.id)
    else
      render :new
    end
  end

  def index
    @events = Event.where(customer_id: params[:customer_id]).order(start_time: :asc)
    #@customer = @events.customer_id
  end

  def detail
    @events = Event.where(id: Comment.where(customer_id: current_customer.id).pluck(:event_id))
  end

  def search
    @search_params = event_search_params
    #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    @events = Event.search(@search_params)
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
    @customer = @event.customer
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path(customer_id: current_customer.id)
  end


  private
  def event_params
    params.require(:event).permit(:start_time, :artist_name, :message)
  end

  def event_search_params
    params.fetch(:search, {}).permit(:artist_name, :start_time_from, :start_time_to, :message)
    #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
    #ここでの:searchには、フォームから送られてくるparamsの値が入っている
  end
end
