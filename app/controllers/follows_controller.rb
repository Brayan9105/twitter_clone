class FollowsController < ApplicationController
  def create
  end

  def follower_users
    @user = User.find(params[:user_id])
    @followers = @user.followers
  end

  def following_users
    @user = User.find(params[:user_id])
    @followings = @user.following
  end
end
