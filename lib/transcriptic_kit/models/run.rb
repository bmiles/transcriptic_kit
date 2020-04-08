module TranscripticKit
  class Run < BaseModel
    [:id, :status, :title, :protocol, :created_at, :accepted_at, :started_at, :updated_at, :completed_at, :results,
      :test_mode, :progress, :quote, :bsl, :protocol, :refs, :instructions, :owner].each do |key|
      attribute(key)
    end

    #For creates not yet availble
    # attribute :title
    # attribute :test_mode
    # attribute :protocol
    # attribute :quote
  end
end
