class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def show
    @comment = Comment.new
    @markers =
      [{
        lat: @event.latitude,
        lng: @event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: @event })
      }]
    # does the user already attend to this event
    @clicked = Attendance.where(user_id: current_user.id, event_id: @event.id).any?
    @user = @event.user
    @attendance = Attendance.where(event: @event.id).count
    @genre = @event.genre
    @comments = Comment.where(event: @event.id).order('updated_at DESC')
  end

  def index
    @events = Event.order('date ASC')
    @markers = @events.geocoded.map do |e|
      {
        lat: e.latitude,
        lng: e.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: e })
      }
    end
  end

  def new
    @event = Event.new
    @genres = Genre.all.sort
  end

  def create
    @event = Event.new(event_params)
    @genre = Genre.find(params[:event][:genre_id])
    @event.genre = @genre
    @event.user = current_user
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
    params.require(:event).permit(:title, :date, :details, :genre_id, :user_id, :address, :photo)
  end
end
