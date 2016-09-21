module TranscripticKit
  class OrganizationResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    def self.new(options)
      @org_name = options[:org_name]

      self.resources.each do |res|
        res.instance_eval("@path = '#{@org_name}/#{res.path}'")
      end

      super(connection: options[:connection])
    end

    resources do
      default_handler(:ok) {|r| OrganizationMapping.extract_single(r.body, :read) }
      get '' => :info
    end
  end
end
