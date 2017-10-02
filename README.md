# UniqIdentifier

[![Code Climate](https://codeclimate.com/github/FinalCAD/uniq_identifier.png)](https://codeclimate.com/github/FinalCAD/uniq_identifier)

[![Dependency Status](https://gemnasium.com/FinalCAD/uniq_identifier.png)](https://gemnasium.com/FinalCAD/uniq_identifier)

[![Build Status](https://travis-ci.org/FinalCAD/uniq_identifier.svg?branch=master)](https://travis-ci.org/FinalCAD/uniq_identifier) (Travis CI)

[![Coverage Status](https://coveralls.io/repos/FinalCAD/uniq_identifier/badge.svg?branch=master)](https://coveralls.io/r/FinalCAD/uniq_identifier?branch=master)

[![Gem Version](https://badge.fury.io/rb/uniq_identifier.svg)](https://badge.fury.io/rb/uniq_identifier)

Add an uniq identifier on your models. For make your model agnostic from backend unique identifier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uniq_identifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uniq_identifier

## Usage

add uuid in your model like that:

```ruby
class Foo < ActiveRecord::Base
  uniq_identifier
end
```

```ruby
foo = Foo.new
foo.id   # => nil
foo.uuid # => "0c6bbc03-a269-44e2-8075-f442e1aac0c8"
```

```ruby
foo.create!
foo.id # => 1
foo.uuid # => "0c6bbc03-a269-44e2-8075-f442e1aac0c8"
```

```ruby
my_foo = Foo.where(uuid: "0c6bbc03-a269-44e2-8075-f442e1aac0c8")
my_foo.id # => 1
```

## Configuration

add app/config/initializers/uniq_identifier.rb

```ruby
UniqIdentifier.configuration do |conf|
  conf.generator = SecureRandom
end
```

you can use the generator

```bash
rails g uniq_identifier:install
rails g uniq_identifier:add <model>
```
for mongoid use

```bash
rails g uniq_identifier:add <model> --orm=mongoid
```

## Options

```ruby
class CustomGenerator
  def uuid
    # ...
  end
end

class Bar
  uniq_identifier generator: CustomGenerator,
                  auto: bool,
                  validate: bool
end
```

* `generator` can be any object which respond to `uuid` signal or `:default` (default: `:default`)
* `auto` if set to false then uuid will not be automatically generated after initialize (default: `true`)
* `validate` if set to false validation will not be added (default: `true`)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/uniq_identifier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Test

```bash
  bundle && ADAPTER=mongoid bundle
```

```bash
  rake
```
