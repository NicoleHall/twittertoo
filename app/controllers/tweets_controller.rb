class TweetsController < ApplicationController

  def index
    @screen_name = current_user.screen_name
    @tweets = current_user.tweets
  end

end
