# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'berkshelf/formatters/notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "berkshelf-formatters-notifier"
  spec.version       = Berkshelf::Formatters::Notifier::VERSION
  spec.authors       = ["Ignacy Kasperowicz"]
  spec.email         = ["ignacy.kasperowicz@gmail.com"]
  spec.description   = %q{Berkshelf formatter which uses OSX notification-center to display messages}
  spec.summary       = "https://github.com/usecide/berkshelf-formatters-notifier"
  spec.homepage      = "https://github.com/usecide/berkshelf-formatters-notifier"
  spec.license       = "MIT"

  spec.add_dependency 'terminal-notifier', '~> 1.5.1'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
