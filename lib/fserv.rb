require 'fserv/config'
require 'fserv/client'
require 'fserv/response'
require 'fserv/exceptions'

require 'rest_client'
require 'json'

module Fserv
  extend self

  def self.config
    @config ||= Config.new
    @config
  end

  def self.config=(config)
    @config = config
  end

  def self.configure(&config)
    @config ||= Config.new
    yield @config
  end
end