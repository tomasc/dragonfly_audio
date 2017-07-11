require 'test_helper'

describe DragonflyAudio::Processors::AlbumArt do
  let(:app) { test_app.configure_with(:audio) }
  let(:processor) { DragonflyAudio::Processors::AlbumArt.new }
  let(:analyser) { DragonflyAudio::Analysers::AudioProperties.new }
  let(:audio) { Dragonfly::Content.new(app, SAMPLES_DIR.join('BroadmoorSirenTest.mp3')) }
  let(:image) { Dragonfly::Content.new(app, SAMPLES_DIR.join('album.jpg')) }

  let(:artist) { 'Elvis Presley' }
  let(:title) { 'Hound Dawg' }

  before { processor.call(audio, image.file.path) }

  describe 'properties' do
    it 'sets the album art' do
      TagLib::MPEG::File.open(audio.file.path) do |file|
        tag = file.id3v2_tag

        cover = tag.frame_list('APIC').first
        cover.picture.must_equal image.data
      end
    end
  end
end
