class FollowsController < ApplicationController
  def create
    @follow = Follow.new
    @artist = User.find(params[:user_id])
    @follow.follower = current_user
    @follow.artist = @artist
    if @follow.save
      respond_to do |format|
        format.html { redirect_to dashboard_path(@artist) }
        format.text {
          render partial: "pages/destroy_follow_button", locals: { user: @artist }, formats: [:html] }
      end
      # redirect_to dashboard_path(@artist), notice: "You are now following #{@artist.user_name}!"
    else
      respond_to do |format|
        format.html { redirect_to dashboard_path(@artist) }
        format.text {
          render partial: "pages/create_follow_button", locals: { user: @artist }, formats: [:html] }
      end
      # redirect_to dashboard_path(@artist), notice: "Something went wrong... 🤷"
    end
  end

  def destroy
    @artist = User.find(params[:user_id])
    @follow = Follow.find_by(artist: @artist, follower: current_user)
    @follow&.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path(@artist) }
      format.text {
        render partial: "pages/create_follow_button", locals: { user: @artist }, formats: [:html] }
    end
    # redirect_to dashboard_path(@artist), notice: "You are not following #{@artist.user_name} anymore..."
  end
end
