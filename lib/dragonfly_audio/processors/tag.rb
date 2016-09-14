require 'taglib'

# IMPORTANT: See http://robinst.github.io/taglib-ruby/

module DragonflyAudio
  module Processors
    class Tag
      PERMISSIBLE_PROPERTIES = DragonflyAudio::Analysers::AudioProperties::TAGS

      def call(content, properties)
        clean_properties = properties.delete_if { |key, _| !PERMISSIBLE_PROPERTIES.include?(key) }

        tempfile = Dragonfly::TempObject.new(content.tempfile)

        TagLib::FileRef.open(tempfile.path) do |file|
          unless file.null?
            tag = file.tag
            clean_properties.each do |key, value|
              tag.send("#{key}=", value)
            end
            file.save
          end
        end

        content.update(tempfile)
      end
    end
  end
end
