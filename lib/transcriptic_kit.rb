require 'active_support/all'
require 'resource_kit'
require 'kartograph'

module TranscripticKit
  require_relative 'transcriptic_kit/client'

  # Utils
  # autoload :PaginatedResource, 'droplet_kit/paginated_resource'
  require_relative 'transcriptic_kit/error_handling_resourcable'

  # Models
  require_relative 'transcriptic_kit/models/base_model'
  require_relative 'transcriptic_kit/models/project'
  require_relative 'transcriptic_kit/models/organization'

  # Resources
  require_relative 'transcriptic_kit/resources/project_resource'
  require_relative 'transcriptic_kit/resources/organization_resource'

  # JSON Maps
  require_relative 'transcriptic_kit/mappings/project_mapping'
  require_relative 'transcriptic_kit/mappings/organization_mapping'

  # Errors
  require_relative 'transcriptic_kit/mappings/error_mapping'
  # autoload :ErrorHandlingResourcable, 'transcriptic_kit/mappings/error_mapping'
  Error = Class.new(StandardError)
  FailedCreate = Class.new(TranscripticKit::Error)
  FailedUpdate = Class.new(TranscripticKit::Error)

  class RateLimitReached < TranscripticKit::Error
    attr_accessor :reset_at
    attr_writer :limit, :remaining

    def limit
      @limit.to_i if @limit
    end

    def remaining
      @remaining.to_i if @remaining
    end
  end
end
