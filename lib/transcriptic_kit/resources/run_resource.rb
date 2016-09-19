module TranscripticKit
  class RunResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do
      default_handler(422) { |response| ErrorMapping.extract_single(response.body, :read) }
      default_handler(:ok, :created) { |response| RunMapping.extract_single(response.body, :read) }
      default_handler { |response| raise "Unexpected response status #{response.status}... #{response.inspect}" }

      action :all do
        verb :get
        path 'swiftpharma/:project_id/runs.json'
        handler(200) { |response| RunMapping.extract_collection(response.body, :read) }
      end

      action :find do
        verb :get
        path 'swiftpharma/:project_id/runs/:run_id.json'
        handler(200) { |response| RunMapping.extract_single(response.body, :read) }
      end

      action :create do
        verb :post
        path 'swiftpharma/:project_id/runs'
        body { |object| RunMapping.representation_for(:create, object) }
        handler(202) { |response| RunMapping.extract_single(response.body, :read) }
      end

      action :update do
        verb :put
        path 'swiftpharma/:project_id/:run_id'
        body { |object| RunMapping.representation_for(:update, object) }
        handler(200) { |response, object| RunMapping.extract_into_object(object, response.body, :read) }
      end
    end
  end
end
