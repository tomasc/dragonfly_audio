require 'dragonfly_audio/analysers/audio_properties'

require 'dragonfly_audio/processors/tag'
require 'dragonfly_audio/processors/album_art'

module DragonflyAudio
  class Plugin
    def call(app, options = {})
      app.add_analyser :audio_properties, Analysers::AudioProperties.new

      Analysers::AudioProperties::TAGS.each do |name|
        app.add_analyser(name) { |c| c.analyse(:audio_properties)[name] }
      end

      Analysers::AudioProperties::AUDIO_PROPS.each do |name|
        app.add_analyser(name) { |c| c.analyse(:audio_properties)[name] }
      end

      app.add_processor :tag, Processors::Tag.new
      app.add_processor :album_art, Processors::AlbumArt.new
    end
  end
end

Dragonfly::App.register_plugin(:audio) { DragonflyAudio::Plugin.new }
