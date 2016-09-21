module TranscripticKit
  class RunResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    def self.new(options)
      @org_name = options[:org_name]

      self.resources.each do |res|
        res.instance_eval("@path = '#{@org_name}/#{res.path}'")
      end

      super(connection: options[:connection])
    end

    resources do
      default_handler(422) { |response| ErrorMapping.extract_single(response.body, :read) }
      default_handler(:ok, :created) { |response| RunMapping.extract_single(response.body, :read) }
      default_handler { |response| raise "Unexpected response status #{response.status}... #{response.inspect}" }

      action :all do
        verb :get
        path ':project_id/runs.json'
        handler(200) { |response| RunMapping.extract_collection(response.body, :read) }
      end

      action :find do
        verb :get
        path ':project_id/runs/:run_id.json'
        handler(200) { |response| RunMapping.extract_single(response.body, :read) }
      end

      action :create do
        verb :post
        path ':project_id/runs'
        body { |object| RunMapping.representation_for(:create, object) }
        handler(202) { |response| RunMapping.extract_single(response.body, :read) }
      end

      action :update do
        verb :put
        path ':project_id/:run_id'
        body { |object| RunMapping.representation_for(:update, object) }
        handler(200) { |response, object| RunMapping.extract_into_object(object, response.body, :read) }
      end
    end
    resources.each do |res|
      res.instance_eval('@path = "#{@org_name}/#{res.path}/"')
    end
  end
end
