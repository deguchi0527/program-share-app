class TweetsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_tweet, only: :show

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:image, :title, :info, :category_id, :link_one, :link_two, :link_three,
                                       :link_four).merge(user_id: current_user.id)
  end
end
