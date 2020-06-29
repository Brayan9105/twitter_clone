class PagesController < ApplicationController
  def feed
    users = current_user.follower_ids
    users << current_user.following_ids
    users << current_user.id
    users.flatten!.uniq!
    @tweets = Tweet.where(user_id: users).paginate(page: params[:page]).order(created_at: :desc)
  end
end
