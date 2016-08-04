# coding: utf-8


lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'job_hunter_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "job_hunter_cli"
  spec.version       = JobHunterCli::VERSION
  spec.authors       = ["Lenn Hypolite"]
  spec.email         = ["lennhydesign@gmail.com"]

  spec.summary       = %q{An efficient and intuitive way to search for any job.}
  spec.description   = %q{JobHunterCli allows you to find a job that suits your needs with a custom search.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables << "job_hunter_cli"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "open-uri"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
