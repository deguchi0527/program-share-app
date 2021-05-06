class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  before_action :move_to_show, only: :destroy
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, nickname: @comment.user.nickname
    else
      redirect_to tweet_path(@comment.tweet.id)
    end
  end

  def destroy
    if @comment.destroy
      ActionCable.server.broadcast 'delete_channel', comment: @comment
    else
      redirect_to tweet_path(@comment.tweet.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def set_comment
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])
  end
  
  def move_to_show
    redirect_to tweet_path(@comment.tweet.id) if current_user.id != @comment.user_id
  end
end
