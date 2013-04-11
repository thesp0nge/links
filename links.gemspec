# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "codesake/links/version"

Gem::Specification.new do |s|
  s.name        = "links"
  s.version     = Codesake::Links::VERSION
  s.authors     = ["Paolo Perego"]
  s.email       = ["paolo@armoredcode.com"]
  s.homepage    = "http://codesake.com"
  s.summary     = %q{Fetch, discover and crawl what's available in a website.}
  s.description = %q{During the first stage of a security test, it's useful to enumerate website urls without making too much noise. Links can help in this using robots.txt or link in a web page telling you the website contents.}
  s.license     = "BSD"

  s.rubyforge_project = "links"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rainbow"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "rainbow"

  s.add_dependency "nokogiri"
  s.add_dependency "mechanize"

  s.add_dependency "codesake_commons"
end
