class EventsController < ApplicationController
  def show; end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @genre = Genre.find(params[:genre_id])
    @event.genre = @genre
    @event.user = current_user
    if @event.save
      flash[:success] = "Your events was created."
      redirect_path to events_path
    else
      render :new
      flash[:warning] = "ERROR: Your events was not created."
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :details)
  end
end
