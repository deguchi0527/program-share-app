class LikesController < ApplicationController
  before_action :set_tweet
  
  def create
    @like = current_user.likes.create(tweet_id: @tweet.id)
  end

  def destroy
    @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user.id)
    @like.destroy
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
