class PagesController < ApplicationController
  def feed
    @tweets = current_user.tweets
  end
end
