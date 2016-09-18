module TranscripticKit
  class Organization < BaseModel
    [:id, :name, :created_at, :subdomain, :profile_photo_attachment_url, :collaborators, :addresses].each do |key|
      attribute(key)
    end
  end
end
