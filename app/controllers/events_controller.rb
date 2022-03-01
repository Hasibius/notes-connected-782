class EventsController < ApplicationController
  def new; end

  def create
    @event = Event.new(event_params)
    @genre = Genre.find(params[:genre_id])
    @event.genre = @genre
    @event.user = current_user
    if @event.save
    else
  end
end
