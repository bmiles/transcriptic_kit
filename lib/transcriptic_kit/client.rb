require 'faraday'

TRANSCRIPTIC_URL = "https://secure.transcriptic.com/"


module TranscripticKit
  class Client

    attr_reader :email, :key, :org_name, :org_url

    def initialize(options = {})
      @email = options.with_indifferent_access[:email]
      @key = options.with_indifferent_access[:key]
      @org_name = options.with_indifferent_access[:org_name]
    end

    def connection
      Faraday.new(connection_options) do |req|
        req.adapter :net_http
      end
    end

    def self.resources
      {
        projects: ProjectResource,
        organization: OrganizationResource,
        runs: RunResource
      }
    end

    def method_missing(name, *args, &block)
      if self.class.resources.keys.include?(name)
        resources[name] ||= self.class.resources[name].new(connection: connection, org_name: @org_name)
        resources[name]
      else
        super
      end
    end

    def resources
      @resources ||= {}
    end

    private

    def connection_options
      {
        url: TRANSCRIPTIC_URL + "/#{@org_name}",
        headers: {
          content_type: 'application/json',
          accept: 'application/json',
          "X-User-Email": email,
          "X-User-Token": key
        }
      }
    end
  end
end
