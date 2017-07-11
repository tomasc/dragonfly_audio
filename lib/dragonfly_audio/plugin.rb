require 'dragonfly_audio/analysers/audio_properties'
require 'dragonfly_audio/processors/tag'
require 'dragonfly_audio/processors/album_art'

module DragonflyAudio
  class Plugin
    def call(app, _opts = {})
      app.add_analyser :audio_properties, DragonflyAudio::Analysers::AudioProperties.new

      [
        DragonflyAudio::Analysers::AudioProperties::TAGS,
        DragonflyAudio::Analysers::AudioProperties::AUDIO_PROPS
      ].flatten.each do |analyser|
        app.add_analyser analyser do |content|
          content.analyse(:audio_properties)[analyser]
        end
      end

      app.add_processor :tag, DragonflyAudio::Processors::Tag.new
      app.add_processor :album_art, DragonflyAudio::Processors::AlbumArt.new
    end
  end
end

Dragonfly::App.register_plugin(:audio) { DragonflyAudio::Plugin.new }
