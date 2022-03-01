class CommentsController < ApplicationController
  # create, update, destroy

  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.event = @event
    @comment.user = current_user
    if @comment.save
      redirect_to event_path(@event), notice: 'Comment was successfully created'
    else
      render 'events/show'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to event_path(@event), notice: 'Comment was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to event_path(@event), notice: 'Comment was successfully destroyed'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
