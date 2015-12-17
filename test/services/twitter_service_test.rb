require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  attr_reader :service

  def setup
    @service = TwitterService.new(User.new(name: "Cole Mersich", screen_name: "ColeMersich", uid: "250190173", oauth_token: ENV["access_token"], oauth_token_secret: ENV["access_token_secret"], created_at: "2015-12-17 01:23:17", updated_at: "2015-12-17 01:23:17", image: nil))
  end

  test 'tweets method show list of tweets' do
    VCR.use_cassette('twitter_service#tweets') do
      tweets = service.tweets
      first_of_my_own_tweets  = tweets.first

      assert_equal 'I like tweeting and testing!',  first_of_my_own_tweets.text
    end
  end
end
