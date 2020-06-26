class PagesController < ApplicationController
  def welcome
    @tweets = current_user.tweets
  end
end
