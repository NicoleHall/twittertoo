class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.image              = auth_info.info.image
      new_user.oauth_token        = auth_info.credentials.access_token
      new_user.oauth_token_secret = auth_info.credentials.access_token_secret
    end
  end

end
