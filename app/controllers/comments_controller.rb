class CommentsController < ApplicationController
  # create, update, destroy
  def new
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
  end

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

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to event_path(@event), notice: 'Comment was successfully updated'
    else
      render 'events/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to event_path(@comment.event), notice: 'Comment was successfully deleted'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :event_id, :user_id)
  end
end
