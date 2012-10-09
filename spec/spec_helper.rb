require 'rubygems'
require 'bundler'

Bundler.setup(:default)

require 'fserv'

RSpec.configure do |config|
  config.mock_framework = :rspec
end