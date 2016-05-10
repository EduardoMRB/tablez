# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tablez/version'

Gem::Specification.new do |spec|
  spec.name          = "tablez"
  spec.version       = Tablez::VERSION
  spec.authors       = ["Nick Palaniuk"]
  spec.email         = ["npalaniuk@gmail.com"]
  spec.summary       = %q(ASCII table generator)
  spec.description   = %q(ASCII table generator in ruby)
  spec.homepage      = "https://github.com/nikkypx/tablez"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.0"
end
