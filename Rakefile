require 'rubygems'
require 'rake'

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  config = YAML.load(File.read('VERSION.yml'))
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "timecop-console #{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :test
