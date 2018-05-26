require 'test_helper'

describe DragonflyAudio::Processors::AlbumArt do
  let(:app) { test_app.configure_with(:audio) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.mp3')) }
  let(:image) { Dragonfly::Content.new(app, SAMPLES_DIR.join('album.jpg')) }
  let(:processor) { DragonflyAudio::Processors::AlbumArt.new }

  let(:artist) { 'Elvis Presley' }
  let(:title) { 'Hound Dawg' }

  before { processor.call(content, image.file.path) }

  describe 'properties' do
    let(:picture) do
      TagLib::MPEG::File.open(content.file.path) do |file|
        file.id3v2_tag.frame_list('APIC').first.picture
      end
    end

    it { picture.must_equal image.data }
  end
end
