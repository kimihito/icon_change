#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
Rails.application.config.middleware.use OmniAuth::Builder do
   provider :twitter, Constants.twitter.consumer_key,Constants.twitter.consumer_secret
end
