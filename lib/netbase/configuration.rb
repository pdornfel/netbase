# frozen_string_literal: true

module Netbase
  # This class enables detailed configuration of the netbase services.
  #
  # By calling
  #
  #   Recaptcha.configuration # => instance of Recaptcha::Configuration
  #
  # or
  #
  #   Netbase.configure do |config|
  #     config # => instance of Recaptcha::Configuration
  #   end
  #
  # Setting the keys with this Configuration
  #
  #   Netbase.configure do |config|
  #     config.username  = 'xxxx'
  #     config.password = 'yyyy'
  #   end
  #
  class Configuration
    DEFAULTS = {
      'api_endpoint' => 'https://api.netbase.com/cb/insight-api/2/',
      'user_agent' => "Netbase Ruby Wrapper #{Netbase::VERSION}"
    }.freeze

    attr_accessor :username, :password
    attr_writer :api_endpoint

    def initialize #:nodoc:
    end

    def username!
      username || raise(NetbaseError, "No username given.")
    end

    def password!
      password || raise(NetbaseError, "No password given.")
    end

    def api_endpoint
      @api_endpoint || DEFAULTS.fetch('api_endpoint')
    end

  end
end
