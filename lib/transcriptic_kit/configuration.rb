module Transcriptic
  class Configuration
    attr_accessor :transcriptic_email, :transcriptic_api_key, :transcriptic_org_name_url

    def initialize
      @transcriptic_email = nil
      @transcriptic_api_key = nil
      @transcriptic_org_name_url = nil
    end
  end
end
