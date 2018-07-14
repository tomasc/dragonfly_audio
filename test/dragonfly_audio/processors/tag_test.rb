require 'test_helper'

describe DragonflyAudio::Processors::Tag do
  let(:app) { test_app.configure_with(:audio) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.mp3')) }
  let(:analyser) { DragonflyAudio::Analysers::AudioProperties.new }
  let(:processor) { DragonflyAudio::Processors::Tag.new }

  let(:artist) { 'Elvis Presley' }
  let(:title) { 'Hound Dawg' }

  before { processor.call(content, artist: artist, title: title) }

  describe 'properties' do
    it { analyser.call(content)['artist'].must_equal artist }
    it { analyser.call(content)['title'].must_equal title }
  end

  describe 'tempfile has extension' do
    it { content.tempfile.path.must_match /\.mp3\z/i }
  end
end
