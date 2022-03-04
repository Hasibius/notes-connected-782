class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events = Event.all
    @genres = Genre.all
  end

  def dashboard
  end
end
