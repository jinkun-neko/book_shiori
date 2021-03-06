# -*- encoding: utf-8 -*-
# stub: forgery_ja 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "forgery_ja".freeze
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["namakesugi".freeze]
  s.date = "2011-06-14"
  s.description = "Create dummy japanese data.".freeze
  s.email = ["info@namakesugi.net".freeze]
  s.homepage = "https://github.com/namakesugi/forgery_ja".freeze
  s.rubygems_version = "3.2.27".freeze
  s.summary = "Forgery for Japanese Data".freeze

  s.installed_by_version = "3.2.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<forgery>.freeze, ["~> 0.3.8"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<forgery>.freeze, ["~> 0.3.8"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
