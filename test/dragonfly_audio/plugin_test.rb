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
    end

  end
end
