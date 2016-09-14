# Dragonfly Audio

[![Build Status](https://travis-ci.org/tomasc/dragonfly_audio.svg)](https://travis-ci.org/tomasc/dragonfly_audio) [![Gem Version](https://badge.fury.io/rb/dragonfly_audio.svg)](http://badge.fury.io/rb/dragonfly_audio) [![Coverage Status](https://img.shields.io/coveralls/tomasc/dragonfly_audio.svg)](https://coveralls.io/r/tomasc/mongoid_recurring)

Wraps common audio-related tasks into [Dragonfly](http://markevans.github.io/dragonfly) analysers and processors.

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly_audio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_audio

## Dependencies

This gem uses [taglib-ruby](https://github.com/robinst/taglib-ruby) to read and write meta data and properties of audio files.

## Usage

Add the `:audio` plugin to your Dragonfly config block:

```ruby
Dragonfly.app.configure do
  plugin :audio
end
```

## Analysers

### audio_properties

Reads properties and tags of an audio file:

```ruby
audio.audio_properties

# => {
#   title: 'The Ship Was Sailing',
#   artist: 'Vito Ricci',
#   album: 'Music From Memory',
#   year: '1985',
#   track: 7
#   genre: 'Ambient',
#   comment: 'This Music was originally composed for "The Memory Theatre of Gulio Camillo" by Matthew Maguire. A Creation production premiered at La Mama Spring 1985 thanks to Bonnie for not laughing to Justin for laughing to Jon Gordron for electronic bondage produced by Jonathan Mann for Pangea Productions recorded 8/85 at Chiens Interdits Studio in a big cover production by Ann Rower cover design by Paul Leone * all compositions by Vito Ricci * play it loud',
#   length: 345,
#   bitrate: 192,
#   channels: 2,
#   sample_rate: 44_100
# }
```

## Processors

### tag

Sets the file's meta information:

```ruby
audio.tag(artist: 'Ariel Kalma', album: 'Le Temps Des Moissons', track: 'Bakafrika')
```

Permissible properties:
* album
* artist
* comment
* genre
* tag
* title
* track
* year

## Contributing

1. Fork it ( https://github.com/tomasc/dragonfly_audio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
