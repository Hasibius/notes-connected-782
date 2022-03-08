class FollowsController < ApplicationController
  def create
    @follow = Follow.new
    @artist = User.find(params[:user_id])
    @follow.follower = current_user
    @follow.artist = @artist
    if @follow.save
      redirect_to dashboard_path(@artist), notice: "You are now following #{@artist.user_name}!"
    else
      redirect_to dashboard_path(@artist), notice: "Something went wrong... 🤷"
    end
  end

  def destroy
    @artist = User.find(params[:user_id])
    @follow = Follow.find_by(artist: @artist, follower: current_user)
    @follow&.destroy
    redirect_to dashboard_path(@artist), notice: "You are not following #{@artist.user_name} anymore..."
  end
end
