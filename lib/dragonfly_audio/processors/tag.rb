require 'taglib'

# IMPORTANT: See http://robinst.github.io/taglib-ruby/

module DragonflyAudio
  module Processors
    class Tag
      PERMISSIBLE_PROPERTIES = Analysers::AudioProperties::TAGS

      def call(content, properties)
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext.downcase)

        # stringify keys
        properties = properties.each_with_object({}) { |(k, v), memo| memo[k.to_s] = v }
        properties = properties.select { |key, _| PERMISSIBLE_PROPERTIES.include?(key) }

        tempfile = Dragonfly::TempObject.new(content.tempfile)

        TagLib::FileRef.open(tempfile.path) do |file|
          return if file.null?
          properties.each { |k, v| file.tag.send("#{k}=", v) }
          file.save
        end

        content.update(tempfile)
      end
    end
  end
end
