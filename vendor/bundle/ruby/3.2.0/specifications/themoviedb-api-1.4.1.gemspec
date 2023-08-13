# -*- encoding: utf-8 -*-
# stub: themoviedb-api 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "themoviedb-api".freeze
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["18Months".freeze]
  s.date = "2023-02-17"
  s.description = "Provides a simple and intuitive interface for the Movie Database API making use of OpenStruct.".freeze
  s.email = ["dev@18months.it".freeze]
  s.homepage = "https://github.com/18Months/themoviedb-api".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "A simple to use Ruby wrapper for the The Movie Database API.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.1"])
  s.add_development_dependency(%q<awesome_print>.freeze, ["~> 1.9"])
  s.add_development_dependency(%q<vcr>.freeze, ["~> 6.1"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12"])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.18"])
  s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.8"])
  s.add_development_dependency(%q<json>.freeze, [">= 2.6.0", "< 3"])
end
