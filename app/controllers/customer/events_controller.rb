class Customer::EventsController < ApplicationController
  def new
  end

  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id
    @event.save
      redirect_to customer_path(current_customer), notice: "投稿を保存しました"
  end

  def index
    @events = Event.where(customer_id: params[:customer_id])
  end

  def search
    @search_params = event_search_params
    #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    @events = Event.search(@search_params)
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
  end

  def edit
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path(current_customer)
  end

  private
  def event_params
    params.permit(:join_day, :artist_name, :message)
  end

  def event_search_params
    params.fetch(:search, {}).permit(:artist_name, :join_day_from, :join_day_to, :message)
    #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
    #ここでの:searchには、フォームから送られてくるparamsの値が入っている
  end
end
