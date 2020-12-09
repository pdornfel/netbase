require 'netbase/version'

module Netbase
  class Client
    include HTTMultiParty

    USER_AGENT            = "Netbase Ruby Wrapper #{Netbase::VERSION}"

    attr_accessor :options
    headers({"User-Agent" => USER_AGENT})

    def initialize(options = {})
      store_options(options)
      if username.nil? || password.nil?
        raise ArgumentError, "a username and passowrd must be present"
      end

    end

    def get(path, query={}, options={})
      handle_response {
        self.class.get(*construct_query_arguments(path, options.merge(:query => query)))
      }
    end

    def post(path, body={},  options={})
      handle_response {
        self.class.post(*construct_query_arguments(path, options.merge(:body => body), :body))
      }
    end

    def put(path, body={},  options={})
      handle_response {
        self.class.put(*construct_query_arguments(path, options.merge(:body => body), :body))
      }
    end

    def delete(path, query={}, options={})
      handle_response {
        self.class.delete(*construct_query_arguments(path, options.merge(:query => query)))
      }
    end

    def username
      @options.username
    end

    def password
      @options.password
    end

    def api_endpoint
      @options.api_endpoint
    end
    alias host api_endpoint

  private

    def handle_response(refreshing_enabled=true, &block)
      response = block.call
      if response && !response.success?
        raise ResponseError.new(response)
      elsif response_is_a?(response, Hash)
        HashResponseWrapper.new(response)
      elsif response_is_a?(response, Array)
        ArrayResponseWrapper.new(response)
      elsif response && response.success?
        response
      end
    end

    def store_options(options={})
      @options = Netbase.with_configuration(options)
    end

    def construct_query_arguments(path_or_uri, options={})
      uri = URI.parse(path_or_uri)
      path = uri.path
      options = options.dup
      options[:basic_auth] = {username: username, password: password}
      [
        "#{host}/#{path}#{uri.query ? "?#{uri.query}" : ""}",
        options
      ]
    end

    def response_is_a?(response, type)
      response.is_a?(type) || (response.respond_to?(:parsed_response) && response.parsed_response.is_a?(type))
    end

  end
end
