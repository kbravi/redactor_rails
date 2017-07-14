# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redactor_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "redactor_rails"
  spec.version       = RedactorRails::VERSION
  spec.authors       = ["Karthik Ravichandran"]
  spec.email         = ["kb1990@gmail.com"]

  spec.summary       = %q{Integrates asset uploaders with the redactor editor}
  spec.homepage      = "https://github.com/kbravi/redactor_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("carrierwave")
  spec.add_dependency("mini_magick")
  spec.add_dependency("mime-types")

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
