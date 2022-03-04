class AttendancesController < ApplicationController
  def index
    @attendance = Attendance.where(user: current_user)
  end

  def show; end

  def create
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
    @attendance.user = current_user
    @attendance.event = @event
    if @attendance.save
      redirect_to event_path(@event), notice: "You are attending to #{@event.title}!"
    else
      redirect_to event_path(@event), notice: "Something went wrong... 🤷"
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find_by(event_id: params[:event_id], user: current_user)
    @attendance&.destroy
    redirect_to event_path(@event), notice: "You are not going to #{@event.title}..."
  end
end
