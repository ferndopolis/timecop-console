# Configure Rails Envinronment
ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../dummy_app/config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'simplecov'
SimpleCov.start do
  add_filter '/config/'
  add_group 'Controllers', 'app/controllers'
  add_group 'Libraries', 'lib'
  add_group 'Specs', 'spec'
end

RSpec.configure do |config|
  config.include TimecopConsole::Engine.routes.url_helpers
end
