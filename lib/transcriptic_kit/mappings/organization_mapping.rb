module TranscripticKit
  class OrganizationMapping
    include Kartograph::DSL

    kartograph do
      mapping Organization
      root_key plural: 'data', singular: 'data',  scopes: [:read]

      property :id, :attributes, scopes: [:read]
    end
  end
end
