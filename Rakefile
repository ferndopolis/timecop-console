require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => :spec
task :default => :spec
namespace :spec do
  task :coverage do
    ENV['INVOKE_SIMPLECOV'] = 'true'
    Rake::Task[:spec].invoke
  end
end
