# TranscripticKit

Based on DropletKit from Digital Ocean

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'transcriptic_kit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transcriptic_kit

## Usage

With your account details, retrieve a client instance.

```ruby
client = TranscripticKit::Client.new(
  email: 'TRANSCRIPTIC_EMAIL',
  key: 'TRANSCRIPTIC_API_KEY',
  org_name: 'TRANSCRIPTIC_ORG_NAME_URL'
)
```

Fetch and list projects:

```ruby
projects = client.projects.all

for project in projects
  puts '#{project.id} | #{project.name}'
end
```
Returns:
```
p1cd1234gwnq | My First Project
p1cd5674zmk5 | My Second Project
p1cd938598xq | My Third Project
```


See the [Examples](https://github.com/bmiles/transcriptic_kit/tree/master/examples) directory for more examples.

## Design

TranscripticKit follows a strict design of resources as methods on your client. For examples, for projects, you will call your client like this:

```ruby
client = TranscripticKit::Client.new(
  email: 'TRANSCRIPTIC_EMAIL',
  key: 'TRANSCRIPTIC_API_KEY',
  org_name: 'TRANSCRIPTIC_ORG_NAME_URL'
)
client.projects #=> ProjectsResource
```

TranscripticKit will return Plain Old Ruby objects(tm) that contain the information provided by the API. For example:

```ruby
client = TranscripticKit::Client.new(
  email: 'TRANSCRIPTIC_EMAIL',
  key: 'TRANSCRIPTIC_API_KEY',
  org_name: 'TRANSCRIPTIC_ORG_NAME_URL'
)
client.projects.all
# => [ TranscripticKit::Project(id: "pbar", name: 'Some study', ...), TranscripticKit::Project(id: "pfoo", name: 'Mammoth Cloning', ...) ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/transcriptic_kit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
