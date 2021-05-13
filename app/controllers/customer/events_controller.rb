class Customer::EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
      redirect_to customer_path(current_customer), notice: "投稿を保存しました"
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:join_day, :artist_name, :message)
  end
end