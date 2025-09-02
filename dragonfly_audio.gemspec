# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly_audio/version'

Gem::Specification.new do |spec|
  spec.name          = 'dragonfly_audio'
  spec.version       = DragonflyAudio::VERSION
  spec.authors       = ['Tomas Celizna', 'Asger Behncke Jacobsen']
  spec.email         = ['tomas.celizna@gmail.com', 'asger@8kilo.com']
  spec.summary       = 'Wraps common audio-related tasks into Dragonfly analysers and processors.'
  spec.homepage      = 'https://github.com/tomasc/dragonfly_audio'
  spec.license       = 'MIT'

  spec.files            = Dir["CHANGELOG.md", "MIT-LICENSE", "README.md", "lib/**/*"]
  spec.require_paths = 'lib'

  spec.add_dependency 'dragonfly', '~> 1.0'
  spec.add_dependency 'taglib-ruby', '~> 1.0'
  spec.add_dependency 'base64'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
end
