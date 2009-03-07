# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{timecop-console}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Trupiano"]
  s.date = %q{2009-03-07}
  s.email = %q{jtrupiano@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "lib/timecop-console", "lib/timecop-console/controllers", "lib/timecop-console/controllers/timecop_controller.rb", "lib/timecop-console/routes.rb", "lib/timecop-console/timecop_controller_methods.rb", "lib/timecop_console.rb", "test/geminstaller.yml", "test/test_helper.rb", "test/timecop_console_test.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jtrupiano/timecop-console}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{johntrupiano}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Expose Timecop's capabilities to the UI in your rails app, allowing QA to take advantage of it.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<timecop>, ["~> 0.2.1"])
    else
      s.add_dependency(%q<timecop>, ["~> 0.2.1"])
    end
  else
    s.add_dependency(%q<timecop>, ["~> 0.2.1"])
  end
end
