# -*- encoding: utf-8 -*-
# stub: tmdb-api 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "tmdb-api".freeze
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andriel Nuernberg".freeze]
  s.date = "2013-11-13"
  s.description = "The Movie Database API v3".freeze
  s.email = ["andrielfn@gmail.com".freeze]
  s.homepage = "https://github.com/andrielfn/tmdb-api".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "The Mobie Database API v3".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<httparty>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
end
