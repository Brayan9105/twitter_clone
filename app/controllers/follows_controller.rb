class FollowsController < ApplicationController
  def create
    user = User.find(params[:id])
    follow = Follow.new(user_id: current_user.id, following_id: user.id)
    follow.save
    redirect_to root_path
  end

  def destroy
    user = User.find(params[:id])
    follow = Follow.where(following_id: user.id, user_id: current_user.id).first
    follow.destroy
    redirect_to root_path
  end

  def follower_users
    @user = User.friendly.find(params[:user_id])
    @followers = @user.followers
  end

  def following_users
    @user = User.friendly.find(params[:user_id])
    @followings = @user.following
  end
end
