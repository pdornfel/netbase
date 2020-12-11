require 'hashie'
require 'httparty'
require 'uri'

require 'netbase/client'
require 'netbase/array_response_wrapper'
require 'netbase/hash_response_wrapper'
require 'netbase/response_error'
require 'netbase/version'
require "netbase/configuration"

module Netbase

  class NetbaseError < StandardError
  end

  def new(options={})
    Client.new(options)
  end
  module_function :new

  def method_missing(method_name, *args, &block)
    return super unless respond_to_missing?(method_name)
    Client.send(method_name, *args, &block)
  end
  module_function :method_missing

  def respond_to_missing?(method_name, include_private=false)
    Client.respond_to?(method_name, include_private)
  end
  module_function :respond_to_missing?

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    config = configuration
    yield(config)
  end

  def self.with_configuration(config)
    original_config = {}
    config.each do |key, value|
      original_config[key] = configuration.send(key)
      configuration.send("#{key}=", value)
    end
    return configuration
  end

end
