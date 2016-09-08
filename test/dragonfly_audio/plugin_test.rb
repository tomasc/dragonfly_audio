require 'test_helper'

module DragonflyAudio
  describe Plugin do

    let(:app) { test_app.configure_with(:audio) }
    let(:audio) { app.fetch_file(SAMPLES_DIR.join('BroadmoorSirenTest.mp3')) }

    # ---------------------------------------------------------------------

    describe 'analysers' do
      it 'adds #audio_properties' do
        audio.must_respond_to :audio_properties
      end

      %i(
        album
        artist
        bitrate
        channels
        comment
        genre
        length
        sample_rate
        title
        track
        year
      ).each do |analyser|
        it "adds ##{analyser.to_s}" do
          audio.must_respond_to analyser
        end
      end
    end

    describe 'processors' do
      it 'adds #tag' do
        audio.must_respond_to :tag
      end
    end

  end
end
