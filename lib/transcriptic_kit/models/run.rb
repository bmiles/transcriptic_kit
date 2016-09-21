module TranscripticKit
  class Run < BaseModel
    [:id, :status, :title, :protocol, :created_at, :accepted_at, :started_at, :updated_at, :completed_at, :results,
      :test_mode, :progress, :total_cost, :bsl, :protocol, :refs, :instructions, :owner].each do |key|
      attribute(key)
    end
    #For creates
    attribute :title
    attribute :test_mode
    attribute :protocol
  end
end
