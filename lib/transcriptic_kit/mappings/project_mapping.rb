module TranscripticKit
  class ProjectMapping
    include Kartograph::DSL

    kartograph do
      mapping Project
      root_key plural: 'results',  scopes: [:read]
      root_key singular: 'project',  scopes: [:update]

      property :name, :webhook_url, :bsl, scopes: [:read, :create]
      property :id, :created_at, :updated_at, :archived_at, :users, scopes: [:read]
      property :name, :bsl, :webhook_url, scopes: [:update]
    end
  end
end
