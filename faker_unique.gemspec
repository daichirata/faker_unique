# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faker_unique/version'

Gem::Specification.new do |spec|
  spec.name          = "faker_unique"
  spec.version       = FakerUnique::VERSION
  spec.authors       = ["Daichi HIRATA"]
  spec.email         = ["bunny.hop.md@gmail.com"]

  spec.summary       = "The patch to add the `uniq` method to faker."
  spec.description   = "The patch to add the `uniq` method to faker."
  spec.homepage      = "https://github.com/daichirata/faker_unique"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faker"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
end
