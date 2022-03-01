class AttendancesController < ApplicationController
  def index
    @attendance = Attendance.where(user: current_user)
  end

  def show; end
end
