require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  attr_reader :service

  def setup
    @service = TwitterService.new(User.new(name: "Cole Mersich", screen_name: "ColeMersich", uid: "250190173", oauth_token: ENV["oauth_token"], oauth_token_secret: ENV["oauth_token_secret"], created_at: "2015-12-17 01:23:17", updated_at: "2015-12-17 01:23:17", image: nil))
  end

  test 'tweets method show list of tweets' do
    VCR.use_cassette('twitter_service#tweets') do
      tweets = service.tweets
      first_of_my_own_tweets  = tweets.first

      assert_equal 'I like tweeting and testing!',  first_of_my_own_tweets.text
    end
  end

  test 'timeline method shows tweets from followed folks' do
    VCR.use_cassette('twitter_service#timeline') do
      tweets = service.tweets
      first_of_timeline  = @service.timeline.first

      assert_equal "Travel Marketers Embrace Virtual Reality as the Next Big Thing  https://t.co/NYef4y7MXT https://t.co/xYTy09HPb6",  first_of_timeline.text
    end
  end
end
