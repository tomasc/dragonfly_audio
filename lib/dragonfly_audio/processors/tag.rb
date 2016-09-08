require 'taglib'

# IMPORTANT: See http://robinst.github.io/taglib-ruby/

# TODO: Fix, currently changes the file directly, how to make it work with a
# temp file or otherwise edit the content (and not the file) directly?

module DragonflyAudio
  module Processors
    class Tag
      PERMISSIBLE_PROPERTIES = %i(album artist comment genre tag title track year)

      def call content, properties
        return if properties.empty?
        taglib_fileref(content, properties)
      end

      private # =============================================================

      def taglib_fileref content, properties
        TagLib::FileRef.open(content.path) do |fileref|
          tag = fileref.tag
          clean_properties(properties).each do |key, value|
            tag.send("#{key}=", value)
          end
          fileref.save
        end
      end

      def clean_properties properties
        properties.delete_if { |key, value| !PERMISSIBLE_PROPERTIES.include?(key) }
      end
    end
  end
end
