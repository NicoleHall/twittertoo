class TweetsController < ApplicationController

  def index
    @screen_name = current_user.screen_name
    @tweets = service.tweets
  end

  def timeline
    @timeline = service.timeline
    @followers = service.followers
  end

  def new
  end

  def create
    @new_tweet = service.compose_tweet(twitter_params[:message])
    #redirect_to tweets_path
  end


private
  def service
    @service ||= TwitterService.new(current_user)
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
