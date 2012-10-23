# encoding: utf-8
require File.expand_path('../lib/timecop_console/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'timecop', '~> 0.2.1'
  gem.authors = ["John Trupiano"]
  gem.description = %q{TimecopConsole manipulates Time.now using Timecop gem.}
  gem.email = ['jtrupiano@gmail.com']
  gem.files = Dir['Gemfile', 'LICENSE', 'README.rdoc', 'Rakefile', 'app/**/*', 'config/**/*', 'lib/**/*']
  gem.homepage = 'https://github.com/jtrupiano/timecop-console'
  gem.name = 'timecop-console'
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  gem.summary = %q{Expose Timecop's capabilities to the UI in your rails app, allowing QA to take advantage of it.}
  gem.test_files = Dir['test/**/*']
  gem.version = TimecopConsole::Version
end
