class TweetsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
  end
end
