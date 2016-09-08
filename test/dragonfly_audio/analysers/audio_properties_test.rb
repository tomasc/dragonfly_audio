require 'test_helper'

module DragonflyAudio
  module Analysers
    describe AudioProperties do
      let(:app) { test_app.configure_with(:audio) }
      let(:audio) { app.fetch_file(SAMPLES_DIR.join('BroadmoorSirenTest.mp3')) }

      it 'analyses "album" property' do
        audio.audio_properties[:album].must_equal 'Album XYZ'
      end

      it 'analyses "artist" property' do
        audio.audio_properties[:artist].must_equal 'Artist'
      end

      it 'analyses "bitrate" property' do
        audio.audio_properties[:bitrate].must_equal 192
      end

      it 'analyses "channels" property' do
        audio.audio_properties[:channels].must_equal 2
      end

      it 'analyses "comment" property' do
        audio.audio_properties[:comment].must_equal '   Comment    '
      end

      it 'analyses "genre" property' do
        audio.audio_properties[:genre].must_equal 'Dance'
      end

      it 'analyses "length" property' do
        audio.audio_properties[:length].must_equal 156
      end

      it 'analyses "sample_rate" property' do
        audio.audio_properties[:sample_rate].must_equal 44100
      end

      it 'analyses "title" property' do
        audio.audio_properties[:title].must_equal 'SongTitle'
      end

      it 'analyses "track" property' do
        audio.audio_properties[:track].must_equal 0
      end

      it 'analyses "year" property' do
        audio.audio_properties[:year].must_equal 0
      end
    end
  end
end
