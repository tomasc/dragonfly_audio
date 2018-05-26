require 'taglib'
require 'rack'

# IMPORTANT: See http://robinst.github.io/taglib-ruby/

module DragonflyAudio
  module Processors
    class AlbumArt
      def call(content, album_art_file)
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext)
        # raise UnsupportedFormat unless content.mime_type == 'audio/mpeg'

        tempfile = content.temp_object

        TagLib::MPEG::File.open(tempfile.path) do |file|
          tag = file.id3v2_tag
          album_art = TagLib::ID3v2::AttachedPictureFrame.new
          album_art.mime_type = Rack::Mime.mime_type(File.extname(album_art_file))
          album_art.description = "Cover"
          album_art.type = TagLib::ID3v2::AttachedPictureFrame::FrontCover
          album_art.picture = File.open(album_art_file, 'rb') { |f| f.read }
          tag.add_frame(album_art)
          file.save
        end

        content.update(tempfile)
      end
    end
  end
end
