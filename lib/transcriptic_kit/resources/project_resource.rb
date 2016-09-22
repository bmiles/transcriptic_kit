module TranscripticKit
  class ProjectResource < ResourceKit::Resource
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
      default_handler(:ok, :created) { |response| ProjectMapping.extract_single(response.body, :read) }
      default_handler { |response| raise "Unexpected response status #{response.status}... #{response.inspect}" }

      action :all do
        verb :get
        puts @org_name
        path "projects.json"
        handler(200) { |response| ProjectMapping.extract_collection(response.body, :read) }
      end

      action :find do
        verb :get
        path ":id.json"
        handler(200) { |response| ProjectMapping.extract_single(response.body, :read) }
      end

      action :create do
        verb :post
        path ""
        body { |object| ProjectMapping.representation_for(:create, object) }
        handler(202) { |response| ProjectMapping.extract_single(response.body, :read) }
      end

      action :update do
        verb :put
        path ":id"
        body { |object| ProjectMapping.representation_for(:update, object) }
        handler(200) { |response, object| ProjectMapping.extract_into_object(object, response.body, :read) }
      end
    end
  end
end
