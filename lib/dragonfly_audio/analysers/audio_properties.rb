require 'taglib'

# IMPORTANT: See http://robinst.github.io/taglib-ruby/

module DragonflyAudio
  module Analysers
    class AudioProperties
      TAGS = %i(title artist album year track genre comment).freeze
      AUDIO_PROPS = %i(length bitrate channels sample_rate).freeze

      def call(content)
        taglib_fileref(content)
      end

      private # =============================================================

      def taglib_fileref(content)
        res = {}
        TagLib::FileRef.open(content.path) do |fileref|
          unless fileref.null?

            TAGS.each do |tag_name|
              res[tag_name] = fileref.tag.send(tag_name)
            end

            AUDIO_PROPS.each do |prop_name|
              res[prop_name] = fileref.audio_properties.send(prop_name)
            end
          end
        end
        res
      end
    end
  end
end
