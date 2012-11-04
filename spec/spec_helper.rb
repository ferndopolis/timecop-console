# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path('../dummy_app/config/environment', __FILE__)

require 'rspec/rails'

RSpec.configure do |config|
  config.include TimecopConsole::Engine.routes.url_helpers
end
