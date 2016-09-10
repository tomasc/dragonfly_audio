require 'test_helper'

describe DragonflyAudio::Processors::Tag do
  let(:app) { test_app.configure_with(:audio) }
  let(:processor) { DragonflyAudio::Processors::Tag.new }
  let(:analyser) { DragonflyAudio::Analysers::AudioProperties.new }
  let(:audio) { Dragonfly::Content.new(app, SAMPLES_DIR.join('BroadmoorSirenTest.mp3')) }

  let(:artist) { 'Elvis Presley' }
  let(:title) { 'Hound Dawg' }

  before { processor.call(audio, artist: artist, title: title) }

  describe 'properties' do
    it 'sets the artist tag property' do
      analyser.call(audio)[:artist].must_equal artist
    end

    it 'sets the title tag property' do
      analyser.call(audio)[:title].must_equal title
    end
  end
end
