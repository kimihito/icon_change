#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
require 'tweetstream'
require 'twitter'
TweetStream.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWIITER_OAUTH_TOKEN_SECRET']
  #      config.oauth_token = user.oauth_token
  #      config.oauth_token_secret = user.oauth_secret
  config.auth_method = :oauth
end
client = TweetStream::Client.new

client.track("#テスト") do |status|
  User.find(:all) do |user|
    if status.user.screen_name == user.screen_name
      Thread.new do
        puts "剛力彩芽、返事する。"
        Twitter.configure do |config|
          config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
          config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
          config.oauth_token = user.oauth_token
          config.oauth_token_secret = user.oauth_secret
        end
        p status.user.screen_name
        mes = "@#{User.screen_name} なんですか"
        puts mes
        #        Twitter.update mes
      end
    end
  end
end
client.userstream
