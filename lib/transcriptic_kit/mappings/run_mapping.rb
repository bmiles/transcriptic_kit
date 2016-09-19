module TranscripticKit
  class RunMapping
    include Kartograph::DSL

    kartograph do
      mapping Run
      # root_key plural: 'results',  scopes: [:read]
      root_key singular: 'run',  scopes: [:update]

      property :id, :status, :created_at, :accepted_at, :started_at, :updated_at, :completed_at, :results, :progress, :total_cost, :bsl, :refs, :instructions, :owner, scopes: [:read]
      property :title, :test_mode, :protocol, scopes: [:create]
    end
  end
end