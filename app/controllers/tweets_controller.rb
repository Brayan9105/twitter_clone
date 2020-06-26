class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new()
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:tweet_id])
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body).merge(user: current_user)
    end
end
