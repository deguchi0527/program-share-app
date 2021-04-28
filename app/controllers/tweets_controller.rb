class TweetsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_tweet, only: :show

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet_form = TweetForm.new
  end

  def create
    @tweet_form = TweetForm.new(tweet_params)
    if @tweet_form.valid?
      @tweet_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet_form).permit(:image, :title, :info, :category_id, :link_one, :link_two, :link_three,
                                       :link_four).merge(user_id: current_user.id)
  end
end
