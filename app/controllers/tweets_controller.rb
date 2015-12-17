class TweetsController < ApplicationController

  def index
    @screen_name = current_user.screen_name
    @tweets = service.tweets
  end

  def timeline
    @timeline = service.timeline
    @followers = service.followers
  end


  def service
    @service ||= TwitterService.new(current_user)
  end
end
