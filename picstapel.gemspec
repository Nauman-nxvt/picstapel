# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picstapel/version'

Gem::Specification.new do |spec|
  spec.name          = "picstapel"
  spec.version       = Picstapel::VERSION
  spec.authors       = ["Nauman Tahir"]
  spec.email         = ["nomibzu@gmail.com"]

  spec.summary       = %q{Collage generator.}
  spec.description   = %q{Enter up to 10 keywords and generate a collage by using images from Flickr.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin/exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rmagick"
  spec.add_dependency "flickraw"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"


end
