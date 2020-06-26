class PagesController < ApplicationController
  def feed
    @tweets = Tweet.where("user_id = ? OR user_id = ? OR user_id = ?", current_user.following_ids, current_user.follower_ids, current_user).order(id: 'DESC')
  end
end
