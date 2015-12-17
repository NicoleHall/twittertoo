class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  # def client
  #   @client ||= Twitter::REST::Client.new do |config|
  #     config.consumer_key = ENV["consumer_key"]
  #     config.consumer_secret = ENV["consumer_secret"]
  #     config.access_token = self.oauth_token
  #     config.access_token_secret = self.oauth_token_secret
  #   end
  # end



  # def description
  #   client.user_description(self.uid.to_i)
  # end

end
