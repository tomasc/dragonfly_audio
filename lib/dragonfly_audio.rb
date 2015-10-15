require 'dragonfly'
require 'dragonfly_audio/plugin'
require 'dragonfly_audio/version'

Dragonfly.app.configure do
  plugin :audio
end
