# -*- encoding: utf-8 -*-
# stub: sass-globbing 1.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "sass-globbing".freeze
  s.version = "1.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Eppstein".freeze]
  s.date = "2016-02-29"
  s.description = "Allows use of globs in Sass @import directives.".freeze
  s.email = ["chris@eppsteins.net".freeze]
  s.homepage = "https://github.com/chriseppstein/sass-globbing".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Allows use of globs in Sass @import directives.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sass>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<sass>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<sass>.freeze, [">= 3.1"])
  end
end
