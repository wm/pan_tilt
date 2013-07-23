# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pan_tilt/version'

Gem::Specification.new do |spec|
  spec.name          = "pan_tilt"
  spec.version       = PanTilt::VERSION
  spec.authors       = ["Will Mernagh"]
  spec.email         = ["wmernagh@gmail.com"]
  spec.description   = %q{Pan and Tilt Arduino connected Servos}
  spec.summary       = %q{TBA}
  spec.homepage      = "https://github.com/wmernagh/pan_tilt"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dino", "~> 0.11.2"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
