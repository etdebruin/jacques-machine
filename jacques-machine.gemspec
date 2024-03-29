# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jacques-machine/version"

Gem::Specification.new do |s|
  s.name        = "jacques-machine"
  s.version     = Jacques::Machine::VERSION
  s.authors     = ["Etienne de Bruin"]
  s.email       = ["et@d.ebru.in"]
  s.homepage    = ""
  s.summary     = %q{Jacques Machine}
  s.description = %q{The next level in AI}

  s.rubyforge_project = "jacques-machine"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "naturalingo"
end
