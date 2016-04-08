# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'content_for_once/version'

Gem::Specification.new do |spec|
  spec.name          = "content_for_once"
  spec.version       = ContentForOnce::VERSION
  spec.authors       = ["Ryusuke Sekiguchi"]
  spec.email         = ["tanukiti1987@gmail.com"]

  spec.summary       = "Embed the HTML tags just only once"
  spec.description   = "Seems like `content_for`, content_for_once embed the HTML tags(especially, `javascript_include_tag` and `stylesheet_link_tag`) just only once."
  spec.homepage      = "https://github.com/tanukiti1987/content_for_once"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionview", ">= 4.1.0"
  spec.add_dependency "activesupport", ">= 4.1.0"
  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4.0"
end
