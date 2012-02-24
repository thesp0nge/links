# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "w3ping/version"

Gem::Specification.new do |s|
  s.name        = "w3ping"
  s.version     = W3ping::VERSION
  s.authors     = ["Paolo Perego"]
  s.email       = ["thesp0nge@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ping an url to check the return status}
  s.description = %q{Sometimes you have to bulk check an url for being opened or closed}

  s.rubyforge_project = "w3ping"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "nokogiri"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "nokogiri"
end
