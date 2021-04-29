class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_tweet, only: [:show, :edit, :update]
  before_action :move_to_index, only: :edit

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

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet.id)
    else
      render :edit
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :title, :info, :category_id, :link_one, :link_two, :link_three,
                                  :link_four).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @tweet.user_id
  end
end
