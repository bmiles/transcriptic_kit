module TranscripticKit
  class RunMapping
    include Kartograph::DSL

    kartograph do
      mapping Run
      root_key singular: 'run',  scopes: [:update]

      property :id, :title, :status, :created_at, :accepted_at, :started_at, :refs, :instructions, :updated_at, :completed_at, :results, :progress, :total_cost, :bsl, :owner, scopes: [:read]
      property :title, :test_mode, :protocol, scopes: [:create]
      # property :refs, :instructions, key: "protocol", scopes: [:create]
    end
  end
end
