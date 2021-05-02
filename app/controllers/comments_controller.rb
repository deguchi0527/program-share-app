class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast "comment_channel", content: @comment, nickname: @comment.user.nickname
    else
      redirect_to tweet_path(@comment.tweet.id)
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])
    if @comment.destroy
      redirect_to tweet_path(@comment.tweet.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
