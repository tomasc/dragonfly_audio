require 'test_helper'

describe DragonflyAudio::Plugin do
  let(:app) { test_app.configure_with(:audio) }
  let(:content) { app.fetch_file(SAMPLES_DIR.join('sample.mp3')) }

  describe 'analysers' do
    it { content.must_respond_to :audio_properties }

    DragonflyAudio::Analysers::AudioProperties::TAGS.each do |analyser|
      it { content.must_respond_to analyser }
    end

    DragonflyAudio::Analysers::AudioProperties::AUDIO_PROPS.each do |analyser|
      it { content.must_respond_to analyser }
    end
  end

  describe 'processors' do
    it { content.must_respond_to :album_art }
    it { content.must_respond_to :tag }
  end
end
