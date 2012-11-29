class User < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.screen_name = auth["info"]["nickname"]
      user.oauth_token = auth['credentials']['token']
      user.oauth_secret = auth['credentials']['secret']
    end
  end
end
