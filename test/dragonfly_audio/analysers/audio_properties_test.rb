require 'test_helper'

describe DragonflyAudio::Analysers::AudioProperties do
  let(:app) { test_app.configure_with(:audio) }
  let(:content) { app.fetch_file(SAMPLES_DIR.join('sample.mp3')) }

  it { content.audio_properties['album'].must_equal 'Album XYZ' }
  it { content.audio_properties['artist'].must_equal 'Artist' }
  it { content.audio_properties['bitrate'].must_equal 192 }
  it { content.audio_properties['channels'].must_equal 2 }
  it { content.audio_properties['comment'].must_equal '   Comment    ' }
  it { content.audio_properties['genre'].must_equal 'Dance' }
  it { content.audio_properties['length'].must_be :>, 150 }
  it { content.audio_properties['sample_rate'].must_equal 44_100 }
  it { content.audio_properties['title'].must_equal 'SongTitle' }
  it { content.audio_properties['track'].must_equal 0 }
  it { content.audio_properties['year'].must_equal 0 }
end
