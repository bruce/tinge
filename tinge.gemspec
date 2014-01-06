# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinge/version'

Gem::Specification.new do |spec|
  spec.name          = "tinge"
  spec.version       = Tinge::VERSION
  spec.authors       = ["Bruce Williams", "Lynn Wallenstein"]
  spec.email         = ["brwcodes@gmail.com"]
  spec.summary       = %q{Extract color information into various formats from CSS/SCSS files.}
  spec.homepage      = "http://github.com/bruce/tinge"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "sass", "3.3.0.rc.2"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
