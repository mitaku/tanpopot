# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tanpopot/version'

Gem::Specification.new do |spec|
  spec.name          = "tanpopot"
  spec.version       = Tanpopot::VERSION
  spec.authors       = ["Takumi Miura"]
  spec.email         = ["mitaku1104@gmail.com"]
  spec.description   = %q{cinch wrapper.}
  spec.summary       = %q{Tanpopot is a IRC BOT.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "cinch"
  spec.add_dependency "trac4r"
end
