module TranscripticKit
  class ProjectMapping
    include Kartograph::DSL

    kartograph do
      mapping Project
      root_key plural: 'data', singular: 'data',  scopes: [:read]
      property :id, :attributes, scopes:[:read]
      # property :name, :attributes, scopes:[:read, :update, :create]
    end
  end
end
