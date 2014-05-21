# -*- encoding: utf-8 -*-
# stub: pry-git 0.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "pry-git"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Mair (banisterfiend)"]
  s.date = "2012-04-03"
  s.description = "A Ruby-aware git layer"
  s.email = "jrmair@gmail.com"
  s.homepage = "http://github.com/pry/pry-git"
  s.rubygems_version = "2.2.2"
  s.summary = "A Ruby-aware git layer"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<diffy>, [">= 0"])
      s.add_runtime_dependency(%q<grit>, [">= 0"])
      s.add_runtime_dependency(%q<pry>, [">= 0.9.8"])
    else
      s.add_dependency(%q<diffy>, [">= 0"])
      s.add_dependency(%q<grit>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<diffy>, [">= 0"])
    s.add_dependency(%q<grit>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0.9.8"])
  end
end
