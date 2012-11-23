# encoding: utf-8
require File.expand_path('../lib/timecop_console/version', __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency 'rails', '~> 3.1'
  spec.add_dependency 'timecop', '~> 0.5'
  spec.authors = ["John Trupiano"]
  spec.description = %q{TimecopConsole manipulates Time.now using Timecop gem.}
  spec.email = ['jtrupiano@gmail.com']
  spec.files = Dir['Gemfile', 'LICENSE', 'README.rdoc', 'Rakefile', 'app/**/*', 'config/**/*', 'lib/**/*']
  spec.homepage = 'https://github.com/jtrupiano/timecop-console'
  spec.name = 'timecop-console'
  spec.require_paths = ['lib']
  spec.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  spec.summary = %q{Expose Timecop's capabilities to the UI in your rails app, allowing QA to take advantage of it.}
  spec.test_files = Dir['spec/**/*']
  spec.version = TimecopConsole::Version
end
