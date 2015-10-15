require 'taglib'

# IMPORTANT: See http://robinst.github.io/taglib-ruby/

module DragonflyAudio
  module Analysers
    class AudioProperties

      def call content
        taglib_fileref(content)
      end

      private # =============================================================

      def taglib_fileref temp_object
        res = {}
        TagLib::FileRef.open(temp_object.path) do |fileref|
          unless fileref.null?

            # TODO: simplify me!
            tag = fileref.tag
            res.merge! title: tag.title
            res.merge! artist: tag.artist
            res.merge! album: tag.album
            res.merge! year: tag.year
            res.merge! tag: tag.year
            res.merge! track: tag.track
            res.merge! genre: tag.genre
            res.merge! comment: tag.comment

            prop = fileref.audio_properties
            res.merge! length: prop.length
            res.merge! bitrate: prop.bitrate
            res.merge! channels: prop.channels
            res.merge! sample_rate: prop.sample_rate

            # prop.merge! %w(title artist album year track genre comment).inject({}) { |res, att| { att => fileref.tag.send(att) } }
            # prop.merge! length: fileref.audio_properties.length
          end
        end
        res
      end

    end
  end
end
