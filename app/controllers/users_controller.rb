class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :memo]
  before_action :set_user, only: [:show, :edit, :update, :memo]
  before_action :move_to_root, only: [:edit, :memo]
  before_action :like_rank, only: [:show, :memo]

  def show
    @tweets = @user.tweets.order('created_at DESC')
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def memo
    @tweets = @user.tweets.order('created_at DESC')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_cofirmation, :profile)
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @user.id
  end

  def like_rank
    @tweet_likes = Tweet.all.sort { |a, b| b.liked_users.count <=> a.liked_users.count }
  end
end
