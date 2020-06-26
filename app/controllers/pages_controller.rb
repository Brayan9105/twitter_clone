class PagesController < ApplicationController
  def feed
    @tweets = current_user.tweets if user_signed_in?
  end
end
