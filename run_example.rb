require './lib/transcriptic_kit'
require 'dotenv'
Dotenv.load

## Create the API client
client = TranscripticKit::Client.new(
  email: ENV['TRANSCRIPTIC_EMAIL'],
  key: ENV['TRANSCRIPTIC_API_KEY'],
  org_name: ENV['TRANSCRIPTIC_ORG_NAME_URL']
)

## Work with your Organization
puts client.organization.info.inspect

puts client.runs.all(project_id: "p19c32pgkwr6p")[0].id

puts client.runs.find(project_id: "p19c32pgkwr6p", run_id: "r19ecb44ap6v8").inspect
