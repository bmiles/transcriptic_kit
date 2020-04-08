module TranscripticKit
  class Project < BaseModel
    [:id, :name, :created_at, :updated_at, :archived_at, :webhook_url, :bsl].each do |key|
      attribute(key)
    end
  end
end
