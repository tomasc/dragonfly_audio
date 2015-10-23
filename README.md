# Dragonfly Audio

[![Build Status](https://travis-ci.org/tomasc/fragonfly_audio.svg)](https://travis-ci.org/tomasc/fragonfly_audio) [![Gem Version](https://badge.fury.io/rb/fragonfly_audio.svg)](http://badge.fury.io/rb/fragonfly_audio) [![Coverage Status](https://img.shields.io/coveralls/tomasc/fragonfly_audio.svg)](https://coveralls.io/r/tomasc/mongoid_recurring)

Wraps common audio-related tasks into [Dragonfly](http://markevans.github.io/dragonfly) analysers and processors.

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly_audio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_audio

## Dependencies

## Usage

Add the `:audio` plugin to your Dragonfly config block:

```ruby
Dragonfly.app.configure do
  plugin :audio
end
```

## Analysers

## Processors

## Contributing

1. Fork it ( https://github.com/tomasc/dragonfly_audio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
