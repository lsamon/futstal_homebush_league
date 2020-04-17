# -*- encoding: utf-8 -*-
# stub: squeel 1.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "squeel".freeze
  s.version = "1.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ernie Miller".freeze, "Xiang Li".freeze]
  s.date = "2015-02-05"
  s.description = "\n      Squeel unlocks the power of Arel in your Rails application with\n      a handy block-based syntax. You can write subqueries, access named\n      functions provided by your RDBMS, and more, all without writing\n      SQL strings. Supporting Rails 3 and 4.\n    ".freeze
  s.email = ["ernie@erniemiller.org".freeze, "bigxiang@gmail.com".freeze]
  s.homepage = "https://github.com/ernie/squeel".freeze
  s.rubyforge_project = "squeel".freeze
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Active Record, improved.".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<polyamorous>.freeze, ["~> 1.1.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.6.0"])
      s.add_development_dependency(%q<faker>.freeze, ["~> 0.9.5"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3.3"])
      s.add_development_dependency(%q<mysql>.freeze, ["~> 2.9.1"])
      s.add_development_dependency(%q<mysql2>.freeze, ["~> 0.3.16"])
      s.add_development_dependency(%q<pg>.freeze, ["~> 0.17.1"])
      s.add_development_dependency(%q<git_pretty_accept>.freeze, ["~> 0.4.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 3.0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0"])
      s.add_dependency(%q<polyamorous>.freeze, ["~> 1.1.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.6.0"])
      s.add_dependency(%q<faker>.freeze, ["~> 0.9.5"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.3"])
      s.add_dependency(%q<mysql>.freeze, ["~> 2.9.1"])
      s.add_dependency(%q<mysql2>.freeze, ["~> 0.3.16"])
      s.add_dependency(%q<pg>.freeze, ["~> 0.17.1"])
      s.add_dependency(%q<git_pretty_accept>.freeze, ["~> 0.4.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0"])
    s.add_dependency(%q<polyamorous>.freeze, ["~> 1.1.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.6.0"])
    s.add_dependency(%q<faker>.freeze, ["~> 0.9.5"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.3"])
    s.add_dependency(%q<mysql>.freeze, ["~> 2.9.1"])
    s.add_dependency(%q<mysql2>.freeze, ["~> 0.3.16"])
    s.add_dependency(%q<pg>.freeze, ["~> 0.17.1"])
    s.add_dependency(%q<git_pretty_accept>.freeze, ["~> 0.4.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
