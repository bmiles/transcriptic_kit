module TranscripticKit
  class Project < BaseModel
    [:id, :name, :created_at, :updated_at, :archived_at, :webhook_url, :bsl, :users].each do |key|
      attribute(key)
    end
    attribute :name
    attribute :bsl
  end
end
