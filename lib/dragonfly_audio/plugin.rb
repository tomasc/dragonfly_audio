require 'dragonfly_audio/analysers/audio_properties'
require 'dragonfly_audio/processors/tag'

module DragonflyAudio
  class Plugin
    def call app, opts={}
      app.add_analyser :audio_properties, DragonflyAudio::Analysers::AudioProperties.new

      %i(
        album
        artist
        bitrate
        channels
        comment
        genre
        length
        sample_rate
        title
        track
        year
      ).each do |analyser|
        app.add_analyser analyser do |content|
          content.analyse(:audio_properties)[analyser]
        end
      end

      app.add_processor :tag, DragonflyAudio::Processors::Tag.new
    end
  end
end

Dragonfly::App.register_plugin(:audio) { DragonflyAudio::Plugin.new }
