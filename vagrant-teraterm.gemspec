require_relative "lib/vagrant-teraterm/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-teraterm"
  spec.version       = VagrantTeraTerm::VERSION
  spec.authors       = ["IIBUN Toshiyuki"]
  spec.email         = ["toshiyuki.iibun@gmail.com"]

  spec.summary       = "A Vagrant plugin for Tera Term integration."
  spec.description   = "This plugin provides integration between Vagrant and Tera Term."
  spec.homepage      = "https://github.com/tiibun/vagrant-teraterm"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "bin/*", "README.md", "LICENSE.txt"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.0"
  spec.add_dependency "vagrant", "~> 2.2"
end
