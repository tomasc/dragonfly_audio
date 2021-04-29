require 'taglib'

# IMPORTANT: See http://robinst.github.io/taglib-ruby/

module DragonflyAudio
  module Analysers
    class AudioProperties
      TAGS = %w[title artist album year track genre comment].freeze
      AUDIO_PROPS = %w[length_in_seconds length_in_milliseconds bitrate channels sample_rate].freeze

      def call(content)
        return {} unless content.ext
        return {} unless SUPPORTED_FORMATS.include?(content.ext.downcase)

        res = {}

        TagLib::FileRef.open(content.path) do |fileref|
          return if fileref.null?
          TAGS.each { |n| res[n] = fileref.tag.send(n) }
          AUDIO_PROPS.each { |n| res[n] = fileref.audio_properties.send(n) }
        end
        
        res["length"] = res["length_in_seconds"]

        res
      end
    end
  end
end
