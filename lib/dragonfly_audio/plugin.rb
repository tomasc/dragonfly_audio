require 'dragonfly_audio/analysers/audio_properties'

module DragonflyAudio
  class Plugin

    def call app, opts={}
      app.add_analyser :audio_properties, DragonflyAudio::Analysers::AudioProperties.new

      app.add_analyser :title do |content|
        content.analyse(:audio_properties)[:title]
      end

      app.add_analyser :artist do |content|
        content.analyse(:audio_properties)[:artist]
      end

      app.add_analyser :album do |content|
        content.analyse(:audio_properties)[:album]
      end

      app.add_analyser :year do |content|
        content.analyse(:audio_properties)[:year]
      end

      app.add_analyser :track do |content|
        content.analyse(:audio_properties)[:track]
      end

      app.add_analyser :genre do |content|
        content.analyse(:audio_properties)[:genre]
      end

      app.add_analyser :comment do |content|
        content.analyse(:audio_properties)[:comment]
      end

      app.add_analyser :length do |content|
        content.analyse(:audio_properties)[:length]
      end

      app.add_analyser :bitrate do |content|
        content.analyse(:audio_properties)[:bitrate]
      end

      app.add_analyser :channels do |content|
        content.analyse(:audio_properties)[:channels]
      end

      app.add_analyser :sample_rate do |content|
        content.analyse(:audio_properties)[:sample_rate]
      end
    end

  end
end

Dragonfly::App.register_plugin(:audio) { DragonflyAudio::Plugin.new }
