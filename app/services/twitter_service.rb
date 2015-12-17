class TwitterService
  attr_reader :client, :user

  def initialize(user)
    @user ||= user
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def tweets
    @client.user_timeline  #defalts to oath keys on the client (user.uid.to_i)
  end

end
