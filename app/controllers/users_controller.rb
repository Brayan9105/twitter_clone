class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @tweets = @user.tweets
  end
end
