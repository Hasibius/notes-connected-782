class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events = Event.all
    @genres = Genre.all
  end

  def dashboard
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @followers = Follow.where(artist: @user).count
    @clicked = Follow.where(artist: @user, follower: current_user).any?
  end
end
