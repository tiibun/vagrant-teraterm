# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-teraterm/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-teraterm"
  spec.version       = VagrantTeraTerm::VERSION
  spec.authors       = ["IIBUN Toshiyuki"]
  spec.email         = ["toshiyuki.iibun@gmail.com"]
  spec.summary       = "This plugin enables to ssh into vm using TeraTerm."
  spec.description   = "This plugin enables to ssh into vm using TeraTerm."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
end
