module TranscripticKit
  class Organization < BaseModel
    [:id, :name, :created_at, :subdomain].each do |key|
      attribute(key)
    end
  end
end
