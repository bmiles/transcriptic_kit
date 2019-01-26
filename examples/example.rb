require './lib/transcriptic_kit'
require 'dotenv'
Dotenv.load

## Create the API client
client = TranscripticKit::Client.new(
  email: ENV['TRANSCRIPTIC_EMAIL'],
  key: ENV['TRANSCRIPTIC_API_KEY'],
  org_name: ENV['TRANSCRIPTIC_ORG_NAME_URL']
)

# Work with your Organization
puts client.organization.info.name

# Work with Projects

# Get all projects
projects = client.projects.all

for project in projects
  puts "#{project.id} | #{project.name}"
end

## Instantiate a new a project, then save it on the server
project = TranscripticKit::Project.new(name: "My New Project", bsl:1)
created = client.projects.create(project)
puts "Project object BSL: #{project.bsl}"
# => 1
puts "Actual project BSL: #{created.bsl}"
# => 1

project.bsl = "2"
puts "Updated project object BSL: #{project.bsl}"
# => 2

## Update on the server
updated = client.projects.update(project, id: created.id)
puts "Updating server side.."
puts "Newly updated project BSL: #{updated.bsl}"
# => 2

## Work with Runs
