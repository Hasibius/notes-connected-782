class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @genre = Genre.find(params[:event][:genre_id])
    @event.genre = @genre
    if @event.save
      redirect_to event_path(@event), notice: "Your event was created."
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :details, :genre_id)
  end
end
