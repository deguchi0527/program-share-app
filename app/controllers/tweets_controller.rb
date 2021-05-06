class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :search_tweet, only: [:index, :show, :search]

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
    @tweet_likes = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    @like = Like.new
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
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user).order('created_at DESC')
    @like = Like.new
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

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  def search
    if params[:q][:category_id_eq] == '1'
      params[:q].delete(:category_id_eq)
      @p = Tweet.ransack(params[:q])
    end
    @results = @p.result.includes(:user).order('created_at DESC')
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :image_two, :image_three, :image_four, :title, :info, :category_id, :private_id, :link_one, :link_two, :link_three,
                                  :link_four).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @tweet.user_id
  end

  def search_tweet
    @p = Tweet.ransack(params[:q])
  end
end
