require 'test_helper'

module DragonflyAudio
  module Processors
    describe Tag do
      let(:app) { test_app.configure_with(:audio) }
      let(:audio) { app.fetch_file(SAMPLES_DIR.join('BroadmoorSirenTest.mp3')) }

      # ---------------------------------------------------------------------

      describe 'artist' do
        it 'changes the artist tag property' do
          skip 'this currently changes the file directly'
          audio.tag(artist: 'Elvis Presley').artist.must_equal 'Elvis Presley'
        end
      end

      describe 'title' do
        it 'changes the title tag property' do
          skip 'this currently changes the file directly'
          audio.tag(title: 'Hound Dawg').title.must_equal 'Hound Dawg'
        end
      end

      describe 'properties' do
        it 'does not try to set "wrong" properties' do
          skip 'this currently changes the file directly, also not sure how to test this correctly'
        end
      end
    end
  end
end
