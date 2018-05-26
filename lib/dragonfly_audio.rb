require 'dragonfly'
require 'dragonfly_audio/plugin'
require 'dragonfly_audio/version'

module DragonflyAudio
  class UnsupportedFormat < RuntimeError; end

  SUPPORTED_FORMATS = %w[aif aiff fla flac m4a mp4 mp4a mp4s mp3 mpga oga ogg ogx wav].freeze
end
