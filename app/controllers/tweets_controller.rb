class TweetsController < ApplicationController

  def index
    @screen_name = current_user.screen_name
    @tweets = current_user.tweets
    # @description = current_user.description
  end

end
