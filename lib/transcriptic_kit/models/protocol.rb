module TranscripticKit
  class Protocol < BaseModel
    [:refs, :instructions].each do |key|
      attribute(key)
    end
  end
end
