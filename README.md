# GyazoSpector [![Build Status](https://travis-ci.org/send/gyazo_spector.svg?branch=master)](https://travis-ci.org/send/gyazo_spector)

GyazoSpector is a Gyazo client for uploading a screenshot of any web page.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gyazo_spector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gyazo_spector

## Usage

```ruby
client = GyazoSpector::Client.new
client.capture('http://example.com')
client.upload!
```

For uploading to another Gyazo-compatible server, then like below.

```ruby
client = GyazoSpector::Client.new(
  site: 'http://gyazo.example.com',
  endpoint: '/path/to/endpoint'
)
```

For capturing seleted elements.

```ruby
client.capture('http://example.com', selector: '#main > p')
```

execute js function before capturing.

```ruby
client.capture(url) do |page|
  page.execute_script("example_function('001')")
  sleep(3)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gyazo_spector.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

