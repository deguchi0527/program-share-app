class CommentsController < ApplicationController
  def create
    binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      redirect_to tweet_path(@comment.tweet.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
