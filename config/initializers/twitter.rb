Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
  #config.oauth_token = YOUR_OAUTH_TOKEN
  #config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end
