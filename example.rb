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
puts client.organization.info.name

## Work with Projects

## Get all projects
projects = client.projects.all

## Instantiate a new a project, then save it on the server
project = TranscripticKit::Project.new(name: "My New Project", bsl:1)
created = client.projects.create(project)
puts project.bsl
# => 1
puts created.bsl
# => 1

project.bsl = "a"
puts project.bsl
# => 2

## Update on the server
updated = client.projects.update(project, id: project.id)
puts updated.bsl
# => 2

## Work with Runs
