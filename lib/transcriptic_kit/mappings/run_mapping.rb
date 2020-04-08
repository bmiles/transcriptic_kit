module TranscripticKit
  class RunMapping
    include Kartograph::DSL

    kartograph do
      mapping Run
      root_key plural: 'data', singular: 'data',  scopes: [:read]

      property :id, :attributes, scopes: [:read]

      ## Create not yet avaiable on the JSON API
      # property :attributes, scopes: [:create]
      # property :refs, :instructions, key: "protocol", scopes: [:create]
    end
  end
end
