class Authentication < ActiveRecord::Base

  belongs_to :user

  def twitter_client
    client = Twitter::Client.new(
      :oauth_token => self.oauth_token,
      :oauth_token_secret => self.oauth_token_secret
     )
  end

  def self.from_omniauth(user, auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authentication|
      authentication.user = user
      authentication.provider = auth.provider
      authentication.uid = auth.uid
      authentication.name = auth.info.name
      authentication.oauth_token = auth.credentials.token
      authentication.oauth_token_secret = auth.credentials.secret
      if auth.credentials.expires_at
        authentication.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
      authentication.save!
    end
  end

  def self.find_by_oauth_hash(oauth_hash)
    Authentication.where(provider: oauth_hash[:provider]).
      where(uid: oauth_hash[:uid]).first
  end

end
