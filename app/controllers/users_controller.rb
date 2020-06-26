class UsersController < ApplicationController
  def show
    @tweets = current_user.tweets
  end
end
