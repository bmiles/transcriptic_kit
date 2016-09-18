module TranscripticKit
  class OrganizationMapping
    include Kartograph::DSL

    kartograph do
      mapping Organization
      root_key plural: 'results',  scopes: [:read]

      property :id, :name, :created_at, :subdomain, :profile_photo_attachment_url, :collaborators, :addresses, scopes: [:read]
    end
  end
end
