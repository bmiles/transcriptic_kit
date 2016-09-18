module TranscripticKit
  class OrganizationResource < ResourceKit::Resource
    include ErrorHandlingResourcable
    resources do
      default_handler(:ok) {|r| OrganizationMapping.extract_single(r.body, :read) }
      get 'swiftpharma' => :info
    end
  end
end
