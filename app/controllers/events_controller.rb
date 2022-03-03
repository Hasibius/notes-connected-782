class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def show
    # @markers = @events.geocoded.map do |e|
    #   {
    #     lat: e.latitude,
    #     lng: e.longitude
    #   }
    # end
  end

  def index
    @events = Event.all
    @markers = @events.geocoded.map do |e|
      {
        lat: e.latitude,
        lng: e.longitude
      }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @genre = Genre.find(params[:event][:genre_id])
    @event.genre = @genre
    @user = current_user
    if @event.save
      redirect_to event_path(@event), notice: "Your event was created."
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :details, :genre_id, :user_id)
  end
end
