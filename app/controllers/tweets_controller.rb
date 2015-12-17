class TweetsController < ApplicationController

  def index
    @screen_name = current_user.screen_name
    @tweets = service.tweets
  end


private

  def service
    @service ||= TwitterService.new(current_user)
  end

end
