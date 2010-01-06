require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  require 'rubygems'
  require 'simple-rss'
  require 'open-uri'
  require 'cgi'

  ENV['RECAPTCHA_PUBLIC_KEY']  = '6Lc5UwoAAAAAAKx6W639fbjuq6L3sSyhkYM6G1B1'
  ENV['RECAPTCHA_PRIVATE_KEY'] = '6Lc5UwoAAAAAACgx6OKAh763tiW1ojj9AI3lZZKX'
  config.time_zone = 'UTC'
end