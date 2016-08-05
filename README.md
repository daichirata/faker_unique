# FakerUnique

The patch to add the `uniq` method to faker.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faker_unique'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faker_unique

## Usage

``` ruby
# return unique values
1000.times.map { Faker::Name.uniq.name }.uniq.size # => 1000

# change number of max retries to generate the unique value, default value is `100`
Faker::Internet.uniq(1000).email

# raise an error when it can't generate a valid value
1000.times.map { Faker::Pokemon.uniq.name } #=> RuntimeError: Maximum retries of 100 reached without finding a unique value

# reset generated values so far
Faker::Pokemon.uniq.reset!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/daichirata/faker_unique.
